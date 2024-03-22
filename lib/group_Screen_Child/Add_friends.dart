import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AddFriends extends StatefulWidget {
  final String targetGroup;

  const AddFriends({Key? key, required this.targetGroup}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  late Stream<QuerySnapshot> _userStream;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _userStream = FirebaseFirestore.instance.collection('Users').snapshots();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts =
          await ContactsService.getContacts(withThumbnails: false);
      for (var contact in contacts) {
        print('Name: ${contact.displayName}, Phone: ${contact.phones}');
        // Add logic to extract phone numbers and perform necessary operations
      }
    } else {
      print('Permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        title: Text(
          "Add Friends",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Enter username',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(
                          () {}); // Trigger rebuild to update search results
                    },
                  ),
                ),
                IconButton(
                  onPressed: _getContacts,
                  icon: Icon(Icons.contacts),
                  tooltip: 'Get Contacts',
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
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

                List<DocumentSnapshot> docs = snapshot.data!.docs;
                String searchValue =
                    _searchController.text.trim().toLowerCase();
                List<DocumentSnapshot> filteredFriends =
                    docs.where((friendSnapshot) {
                  final username = friendSnapshot['username'] as String;
                  return username.toLowerCase().contains(searchValue);
                }).toList();

                return ListView.builder(
                  itemCount: filteredFriends.length,
                  itemBuilder: (context, index) {
                    var friendSnapshot = filteredFriends[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          title: Text(
                            friendSnapshot['username'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            friendSnapshot['email'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              print("Group name ${widget.targetGroup}");

                              String userId = friendSnapshot.id;
                              String username = friendSnapshot['username'];

                              // Add userId and username to the groupMembers array in Firestore
                              await FirebaseFirestore.instance
                                  .collection('groups')
                                  .doc(widget.targetGroup)
                                  .update({
                                'groupMembers': FieldValue.arrayUnion([
                                  {'userId': userId, 'username': username}
                                ]),
                              });
                            },
                            icon: Icon(Icons.person_add_alt_sharp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
