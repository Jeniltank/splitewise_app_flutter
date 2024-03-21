// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ProfilScreen extends StatefulWidget {
//   const ProfilScreen({Key? key});
//
//   @override
//   State<ProfilScreen> createState() => _ProfilScreenState();
// }
//
// class _ProfilScreenState extends State<ProfilScreen> {
//   // User
//   final currentUser = FirebaseAuth.instance.currentUser!;
//
//   // Function to edit a field
//   Future<void> editField(String field) async {
//     // Implement your logic to edit the specified field
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         automaticallyImplyLeading: false,
//         title: Center(
//           child: Text(
//             'Profile',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("Users")
//             .doc(currentUser.email)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           } else if (snapshot.data == null || snapshot.data!.data() == null) {
//             // Handle the case when snapshot data is null
//             return Center(
//               child: Text(
//                 "No data available",
//                 style: TextStyle(color: Colors.white),
//               ),
//             );
//           } else {
//             // Extract user data from the snapshot
//             final userData = snapshot.data!.data()! as Map<String, dynamic>;
//             // Use userData to render UI components
//             return ListView(
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 // Profile Picture
//                 const Icon(
//                   Icons.person,
//                   size: 72,
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 // User Email
//                 Text(
//                   currentUser.email!,
//                   style: TextStyle(color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 // User Details
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25),
//                   child: Text(
//                     "My Details",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 // User Name
//                 MyTextBox(
//                   text: userData['username'] ?? '',
//                   secationName: 'username',
//                   onPressed: () => editField('username'),
//                 ),
//                 // Bio
//                 MyTextBox(
//                   text: userData['bio'] ?? '',
//                   secationName: 'bio',
//                   onPressed: () => editField('bio'),
//                 ),
//                 // User Posts
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25),
//                   child: Text(
//                     "My posts",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   MyTextBox(
//       {required text,
//       required String secationName,
//       required Future<void> Function() onPressed}) {}
// }
// import 'package:flutter/material.dart';
//
// class MyTextBox extends StatefulWidget {
//   final String text;
//   final String sectionName; // Corrected variable name
//   final void Function()? onPress; // Corrected variable name
//   const MyTextBox({
//     Key? key,
//     required this.text,
//     required this.sectionName,
//     required this.onPress,
//     required Future<void> Function() onPressed,
//     required String sectionNmae,
//   }) : super(key: key);
//
//   @override
//   State<MyTextBox> createState() => _MyTextBoxState();
// }
//
// class _MyTextBoxState extends State<MyTextBox> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.teal,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: EdgeInsets.only(left: 15, right: 0, top: 0, bottom: 15),
//       margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // sectionname
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(widget.sectionName),
//               if (widget.onPress != null) // Check if onPress is not null
//                 IconButton(
//                   onPressed: widget.onPress, // Accessing onPress through widget
//                   icon: Icon(Icons.edit),
//                 ),
//             ],
//           ),
//           //text
//           Text(widget.text), // Accessing text through widget
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyTextBox extends StatefulWidget {
  final String text;
  final String sectionName;
  final void Function()? onPress;

  const MyTextBox({
    Key? key,
    required this.text,
    required this.sectionName,
    required this.onPress,
    required Function() onPressed,
    required String sectionNmae,
  }) : super(key: key);

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade800, // Use a darker shade of teal
        borderRadius: BorderRadius.circular(12), // Increase border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Add a subtle shadow
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(20), // Increase padding for better spacing
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.sectionName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Increase font size for section name
                  fontWeight: FontWeight.bold, // Apply bold font weight
                ),
              ),
              if (widget.onPress != null)
                IconButton(
                  onPressed: widget.onPress,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white, // Set icon color to white
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16, // Increase font size for text
            ),
          ),
        ],
      ),
    );
  }
}
