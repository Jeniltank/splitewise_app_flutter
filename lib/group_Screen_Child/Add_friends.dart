import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFriends extends StatefulWidget {
  final String targetGroup;

  const AddFriends({Key? key, required this.targetGroup}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  @override
  Widget build(BuildContext context) {
    final _userStream =
        FirebaseFirestore.instance.collection('Users').snapshots();
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        title: Text(
          "Add Friends",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: _userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Connection error",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          }
          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Text(
                      docs[index]['username'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      docs[index]['email'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        print("Group name ${widget.targetGroup}");

                        String userId = docs[index].id;
                        var data = docs[index].data();
                        // print("Group name ${data}");

                        if (true) {
                          // String groupName = data['groupName'] as String;
                          print("Group name ${widget.targetGroup}");
                          // Add userId to the groupMembers array in Firestore
//

                          await FirebaseFirestore.instance
                              .collection('groups')
                              .doc(widget.targetGroup)
                              .update({
                            'groupMembers': FieldValue.arrayUnion([userId]),
                          });

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => GroupListView(
                          //       groupName: "",
                          //       groupId: data['groupId'],
                          //       groupType: "",
                          //       groupMembers: [], // Initialize with an empty list
                          //     ),
                          //   ),
                          // );
                        } else {
                          // Handle case where groupName field is missing
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                  'Group name not found in Firestore document.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      icon:
                          Icon(Icons.person_add_alt_sharp, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
