// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/group_Screen_Child/Add_friends.dart';
//
// class GroupListView extends StatefulWidget {
//   final String groupName;
//   final String groupType;
//   final String groupId;
//   final List<String> groupMembers;
//
//   const GroupListView({
//     Key? key,
//     required this.groupName,
//     required this.groupType,
//     required this.groupMembers,
//     required this.groupId,
//   }) : super(key: key);
//
//   @override
//   _GroupListViewState createState() => _GroupListViewState();
// }
//
// class _GroupListViewState extends State<GroupListView> {
//   IconData iconData = Icons.food_bank;
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine the icon based on the group type
//     if (widget.groupType.toLowerCase() == 'food') {
//       iconData = Icons.food_bank; // Example icon for food
//     } else {
//       iconData = Icons.airplanemode_active; // Example icon for trip
//     }
//
//     return Scaffold(
//       //  backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Row(
//           children: [
//             SizedBox(
//               width: 50,
//             ),
//             Icon(
//               iconData,
//               size: 30,
//               color: Colors.white,
//             ),
//             SizedBox(width: 10),
//             Text(
//               widget.groupName,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   'Group Type: ',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(width: 5),
//                 Text(
//                   widget.groupType,
//                   style: TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.groupMembers.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Card(
//                       elevation: 2,
//                       color: Colors.grey[900],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                       ),
//                       child: ListTile(
//                         title: Text(
//                           widget.groupMembers[index],
//                           style: TextStyle(color: Colors.black, fontSize: 18),
//                         ),
//                         leading: CircleAvatar(
//                           backgroundColor: Colors.teal,
//                           child: Icon(
//                             Icons.person,
//                             color: Colors.black,
//                           ),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                           ),
//                           onPressed: () {
//                             // Implement delete functionality
//                             setState(() {
//                               widget.groupMembers.removeAt(index);
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final selectedFriendId = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddFriends(
//                         targetGroup: widget.groupId,
//                       ),
//                     ),
//                   );
//
//                   // If a friend was selected, add them to the group
//                   if (selectedFriendId != null) {
//                     setState(() {
//                       widget.groupMembers.add(selectedFriendId);
//                     });
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                   primary: Colors.teal,
//                   textStyle:
//                       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Add Friend',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/group_Screen_Child/Add_friends.dart';

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
              child: StreamBuilder<List<String>>(
                stream:
                    _getGroupMembersStream(), // Your stream of group members
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<String> groupMembers = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: groupMembers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Card(
                            elevation: 2,
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              title: Text(
                                groupMembers[index],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.teal,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    // Implement delete functionality
                                    groupMembers.removeAt(index);
                                  });
                                },
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
            Center(
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }

  // Example method to get a stream of group members
  Stream<List<String>> _getGroupMembersStream() {
    // Reference to the Firestore collection
    CollectionReference groupsCollection =
        FirebaseFirestore.instance.collection('groups');

    // Return a stream of snapshots from Firestore
    return groupsCollection.doc(widget.groupId).snapshots().map((snapshot) {
      // Check if snapshot data is available and not null
      if (snapshot.data() != null) {
        // Extract the groupMembers field from the snapshot data
        dynamic data = snapshot.data()!;
        List<dynamic> groupMembersData = data['groupMembers'] ?? [];

        // Convert dynamic list to List<String>
        List<String> groupMembers =
            groupMembersData.map((member) => member.toString()).toList();

        // Return the list of group members
        return groupMembers;
      } else {
        // Handle case when snapshot data is null or unavailable
        return [];
      }
    });
  }
}
