// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:splitewise_flutter/Widgets/storedata.dart';
// //
// // class ProfilScreen extends StatefulWidget {
// //   const ProfilScreen({Key? key});
// //
// //   @override
// //   State<ProfilScreen> createState() => _ProfilScreenState();
// // }
// //
// // class _ProfilScreenState extends State<ProfilScreen> {
// //   // User
// //   final currentUser = FirebaseAuth.instance.currentUser!;
// //   // edit fild
// //   Future<void> editField(String field) async {}
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         backgroundColor: Colors.black87,
// //         appBar: AppBar(
// //           backgroundColor: Colors.teal,
// //           automaticallyImplyLeading: false,
// //           title: Center(
// //             child: Text(
// //               'Profile',
// //               style: TextStyle(color: Colors.white),
// //             ),
// //           ),
// //         ),
// //         body: StreamBuilder<DocumentSnapshot>(
// //           stream: FirebaseFirestore.instance
// //               .collection("Users")
// //               .doc(currentUser.email)
// //               .snapshots(),
// //           builder: (context, snapshot) {
// //             if (snapshot.hasData) {
// //               final userData = snapshot.data!.data() as Map<String, dynamic>;
// //               // Use userData to render UI components
// //               return ListView(
// //                 children: [
// //                   const SizedBox(
// //                     height: 30,
// //                   ),
// //                   // Profile Picture
// //                   const Icon(
// //                     Icons.person,
// //                     size: 72,
// //                   ),
// //                   const SizedBox(
// //                     height: 30,
// //                   ),
// //                   // User Email
// //                   Text(
// //                     currentUser.email!,
// //                     style: TextStyle(color: Colors.white),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                   const SizedBox(
// //                     height: 30,
// //                   ),
// //                   // User Details
// //                   Padding(
// //                     padding: const EdgeInsets.only(left: 25),
// //                     child: Text(
// //                       "My Details",
// //                       style: TextStyle(color: Colors.white),
// //                     ),
// //                   ),
// //                   // User Name
// //                   MyTextBox(
// //                     text: 'admin',
// //                     secationName: 'username',
// //                     onPressed: () => editField('username'),
// //                     sectionName: '',
// //                   ), // Corrected usage
// //
// //                   //bio
// //
// //                   MyTextBox(
// //                     text: 'empty bio',
// //                     secationName: 'bio',
// //                     onPressed: () => editField('bio'),
// //                     sectionName: '',
// //                   ), //
// //                   // User Posts
// //
// //                   Padding(
// //                     padding: const EdgeInsets.only(left: 25),
// //                     child: Text(
// //                       "My posts",
// //                       style: TextStyle(color: Colors.white),
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             } else if (snapshot.hasError) {
// //               // Placeholder widget or loading indicator when data is not available yet
// //               return Center(
// //                 child: Text("Erro${snapshot.error}"),
// //               ); // Or any other widget
// //             } else {
// //               return Center(
// //                 child: CircularProgressIndicator(),
// //               );
// //             }
// //           },
// //         ));
// //   }
// // }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/Widgets/Textbox.dart';
// import 'package:splitewise_flutter/firebase_login_or_signup/loginPage.dart';
//
// class ProfilScreen extends StatefulWidget {
//   const ProfilScreen({super.key});
//
//   @override
//   State<ProfilScreen> createState() => _ProfilScreenState();
// }
//
// class _ProfilScreenState extends State<ProfilScreen> {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   final userCollaction = FirebaseFirestore.instance.collection('Users');
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     // Navigate to the login screen
//     Navigator.pushReplacementNamed(
//         context, '/login'); // Replace '/login' with your login screen route
//   }
//
//   // edit fild
//   Future<void> editFild(String field) async {
//     String newvalue = "";
//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.black,
//         title: Text(
//           "Edit  " + field,
//           style: TextStyle(color: Colors.white),
//         ),
//         content: TextField(
//           autofocus: true,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//           decoration: InputDecoration(
//             hintText: "Enter new $field",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//           onChanged: (value) {
//             newvalue = value;
//           },
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               "Cancle",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(newvalue),
//             child: Text(
//               "Save",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//     // updata in firesto
//     if (newvalue.trim().length > 0) {
//       await userCollaction.doc(currentUser?.uid).update({field: newvalue});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text(
//           "Profil Screen",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         actions: [
//           // Logout IconButton
//           IconButton(
//             icon: Icon(Icons.logout,
//                 color: Colors.white), // Set the color to white
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("Users")
//               .doc(currentUser
//                   ?.uid) // Use currentUser?.uid to handle null safety
//               .snapshots(),
//           builder: (context, snapshot)
//               // get User
//               {
//             if (snapshot.hasData) {
//               final userData = snapshot.data!.data() as Map<String, dynamic>;
//               return ListView(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   // user profil
//                   CircleAvatar(
//                     radius: 40, // Increase the radius to increase the size
//                     backgroundColor:
//                         Colors.teal, // Set the background color to teal
//                     child: Icon(
//                       Icons.person,
//                       size: 72,
//                       color: Colors.white, // Set the icon color to white
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   // user name
//                   if (currentUser != null)
//                     Text(
//                       currentUser!.email ?? 'No email found',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.grey[700], fontSize: 20),
//                     ),
//                   // details
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Text(
//                       'My Details',
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                   ),
//                   // username
//                   MyTextBox(
//                     text: userData['username'],
//                     sectionNmae: 'username',
//                     onPress: () => editFild('username'),
//                     sectionName: 'username',
//                   ),
//                   // bio
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Text(
//                       'My Bio',
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                   ),
//                   MyTextBox(
//                     text: userData['bio'],
//                     sectionNmae: 'bio',
//                     onPress: () => editFild('bio'),
//                     sectionName: 'bio',
//                   ),
//
//                   // userpost
//                 ],
//               );
//             } else if (snapshot.hasError) {}
//             return Center(
//               child: Text('Error${snapshot.error}'),
//             );
//           } //return Center(child: CircularProgressIndicator(),);
//           ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Widgets/Textbox.dart';
//
// class ProfilScreen extends StatefulWidget {
//   const ProfilScreen({Key? key});
//
//   @override
//   State<ProfilScreen> createState() => _ProfilScreenState();
// }
//
// class _ProfilScreenState extends State<ProfilScreen> {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   final userCollection = FirebaseFirestore.instance.collection('Users');
//
//   Future<void> _logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, '/login()');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.teal.shade800,
//         title: Text(
//           "Profile Screen",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.logout,
//               color: Colors.white,
//             ),
//             onPressed: () => _logout(context),
//           ),
//         ],
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("Users")
//             .doc(currentUser?.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             if (snapshot.hasData && snapshot.data!.exists) {
//               final userData = snapshot.data!.data() as Map<String, dynamic>;
//               return ListView(
//                 padding: EdgeInsets.all(20),
//                 children: [
//                   SizedBox(height: 20),
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.teal.shade800,
//                     child: Icon(
//                       Icons.person,
//                       size: 40,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     currentUser!.email ?? 'No email found',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.grey[700], fontSize: 20),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'My Details',
//                     style: TextStyle(color: Colors.grey[700], fontSize: 18),
//                   ),
//                   MyTextBox(
//                     text: userData['username'] ?? 'No username found',
//                     sectionName: 'Username',
//                     onPressed: () => editField('username'),
//                     onPress: () {},
//                     sectionNmae: '',
//                   ),
//                 ],
//               );
//             } else {
//               return Center(child: Text('No data found'));
//             }
//           }
//         },
//       ),
//     );
//   }
//
//   editField(String s) {}
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Widgets/Textbox.dart';
//
// class ProfilScreen extends StatefulWidget {
//   const ProfilScreen({Key? key});
//
//   @override
//   State<ProfilScreen> createState() => _ProfilScreenState();
// }
//
// class _ProfilScreenState extends State<ProfilScreen> {
//   final userCollection = FirebaseFirestore.instance.collection('Users');
//
//   Future<void> _logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, '/login');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//
//     if (currentUser == null) {
//       // If no user is logged in, return a placeholder widget
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("Profile Screen"),
//         ),
//         body: Center(
//           child: Text("No user logged in."),
//         ),
//       );
//     }
//
//     return Scaffold(
//       //backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text(
//           "Profile Screen",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.logout,
//               color: Colors.white,
//             ),
//             onPressed: () => _logout(context),
//           ),
//         ],
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection("Users")
//             .doc(currentUser.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('User data not found.'));
//           } else {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;
//             return ListView(
//               padding: EdgeInsets.all(20),
//               children: [
//                 SizedBox(height: 20),
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundColor: Colors.teal.shade800,
//                   child: Icon(
//                     Icons.person,
//                     size: 40,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   currentUser.email ?? 'No email found',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey[700], fontSize: 20),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'My Details',
//                   style: TextStyle(color: Colors.grey[700], fontSize: 18),
//                 ),
//                 MyTextBox(
//                   text: userData['username'] ?? 'No username found',
//                   sectionName: 'Username',
//                   onPressed: () => editField('username'),
//                   onPress: () {}, sectionNmae: '',
//                   //sectionName: '',
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   editField(String field) {}
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/Textbox.dart'; // Assuming this is your custom widget for text boxes
import '../firebase_login_or_signup/loginPage.dart'; // Assuming this is where your LoginPage resides

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.hasData && snapshot.data!.exists) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    currentUser!.email ?? 'No email found',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                  MyTextBox(
                    text: userData['username'] ?? 'No username found',
                    sectionName: 'Username',
                    onPressed: () => editField('username'),
                    onPress: () {},
                    sectionNmae: '',
                    //sectionName: '',
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data found'));
            }
          }
        },
      ),
    );
  }

  editField(String fieldName) {
    // Add logic for editing field
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ProfilScreen(),
      '/login': (context) => LoginPage(),
    },
  ));
}
