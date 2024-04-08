import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/add_expance%20Scren.dart';
import 'package:splitewise_flutter/group_Screen_Child/Add_friends.dart';

//import '../add_expense_screen.dart';

class GroupListView extends StatefulWidget {
  final String groupName;
  final String groupType;
  final String groupId;
  final List<String> groupMembers;

  const GroupListView({
    Key? key,
    required this.groupName,
    required this.groupType,
    required this.groupMembers,
    required this.groupId,
  }) : super(key: key);

  @override
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
  IconData iconData = Icons.food_bank;

  @override
  Widget build(BuildContext context) {
    // Determine the icon based on the group type
    if (widget.groupType.toLowerCase() == 'food') {
      iconData = Icons.food_bank; // Example icon for food
    } else {
      iconData = Icons.airplanemode_active; // Example icon for trip
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Icon(
              iconData,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              widget.groupName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Group Type: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  widget.groupType,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: getGroupMembersStream(
                    widget.groupId), // Your stream of group members
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List groupMembers = snapshot.data ?? [];
                    print("Group Members: $groupMembers");
                    return ListView.builder(
                      itemCount: groupMembers.length,
                      itemBuilder: (context, index) {
                        String username = groupMembers[index]['username'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            elevation: 2,
                            color: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                              title: Text(
                                username,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  // Remove the member from Firestore
                                  await FirebaseFirestore.instance
                                      .collection('groups')
                                      .doc(widget.groupId)
                                      .update({
                                    'groupMembers': FieldValue.arrayRemove(
                                        [groupMembers[index]])
                                  });

                                  setState(() {
                                    // Remove the member from the local list
                                    widget.groupMembers.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final selectedFriendId = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddFriends(
                          targetGroup: widget.groupId,
                        ),
                      ),
                    );

                    // If a friend was selected, add them to the group
                    if (selectedFriendId != null) {
                      setState(() {
                        widget.groupMembers.add(selectedFriendId);
                      });

                      // Retrieve the username from the selectedFriendId
                      String username = await _getUsername(selectedFriendId);

                      // Store activity in the 'Activity' collection
                      await FirebaseFirestore.instance
                          .collection('Activity')
                          .add({
                        'message':
                            'User "$username" added to group "${widget.groupName}"',
                        'userId': selectedFriendId,
                        // Storing userId along with the activity
                        'username': username,
                        // Storing username along with the activity
                        'timestamp': FieldValue.serverTimestamp(),
                        // Add timestamp
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    primary: Colors.teal,
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Add Friend',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    print("widget.groupMembers ${widget.groupMembers}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpenseScreen(
                          groupId: widget.groupId,
                          groupMembers: widget.groupMembers,
                          groupName: widget.groupName,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    primary: Colors.teal,
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Add Expense',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getUsername(String userId) async {
    // Retrieve the username associated with the userId from Firestore
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      return userSnapshot['username'];
    } else {
      return 'Unknown User';
    }
  }
}

Stream getGroupMembersStream(groupId) {
  // Reference to the Firestore collection
  CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection('groups');

  // Return a stream of snapshots from Firestore
  return groupsCollection.doc(groupId).snapshots().map((snapshot) {
    // Check if snapshot data is available and not null
    if (snapshot.data() != null) {
      // Extract the groupMembers field from the snapshot data
      dynamic data = snapshot.data()!;
      List<dynamic> groupMembersData = data['groupMembers'] ?? [];

      // Convert dynamic list to List<String>
      List groupMembers = groupMembersData.map((member) => member).toList();

      // Return the list of group members
      return groupMembers;
    } else {
      // Handle case when snapshot data is null or unavailable
      return [];
    }
  });
}
