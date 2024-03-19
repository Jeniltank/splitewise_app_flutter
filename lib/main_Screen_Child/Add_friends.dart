import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({Key? key}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  Map<String, dynamic>? userMap;
  TextEditingController _searchController = TextEditingController();

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('Users')
        .where("email", isEqualTo: _searchController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        userMap = querySnapshot.docs[0].data();
      });
      print(userMap);
    } else {
      print('User not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "Add Friends",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ), // Add some spacing between text field and button
          ElevatedButton(
            onPressed: onSearch,
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // Set button color to green
            ),
            child: Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
          userMap != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.account_box),
                      //  title: Text(userMap!['name'] ?? 'Name not available'),
                      title: Text(
                        userMap!['email'] ?? 'Email not available',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.message),
                    ),
                  ),
                )
              : Container(),

          // Add other widgets below the search field as needed
        ],
      ),
    );
  }

  // Widget chatTitle(Size size) {
  //   // Implement your chat title widget here
  //   return Container(
  //     width: size.width,
  //     height: size.height * 0.1,
  //     color: Colors.blue,
  //     child: Center(
  //       child: Text(
  //         'Chat Title',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
