// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class MyTextBox extends StatelessWidget {
//   const MyTextBox({
//     required this.text,
//     required this.sectionName,
//     required this.onPressed,
//     required String secationName,
//   });
//
//   final String text;
//   final String sectionName;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.green,
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//       margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.edit, color: Colors.white),
//             onPressed: onPressed,
//           ),
//         ],
//       ),
//     );
//   }
// }
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
//   // edit fild
//   Future<void> editField(String field) async {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black87,
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           automaticallyImplyLeading: false,
//           title: Center(
//             child: Text(
//               'Profile',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         body: StreamBuilder<DocumentSnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("Users")
//               .doc(currentUser.email)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final userData = snapshot.data!.data() as Map<String, dynamic>;
//               // Use userData to render UI components
//               return ListView(
//                 children: [
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   // Profile Picture
//                   const Icon(
//                     Icons.person,
//                     size: 72,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   // User Email
//                   Text(
//                     currentUser.email!,
//                     style: TextStyle(color: Colors.white),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   // User Details
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Text(
//                       "My Details",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   // User Name
//                   MyTextBox(
//                     text: 'admin',
//                     secationName: 'username',
//                     onPressed: () => editField('username'),
//                     sectionName: '',
//                   ), // Corrected usage
//
//                   //bio
//
//                   MyTextBox(
//                     text: 'empty bio',
//                     secationName: 'bio',
//                     onPressed: () => editField('bio'),
//                     sectionName: '',
//                   ), //
//                   // User Posts
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Text(
//                       "My posts",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               );
//             } else if (snapshot.hasError) {
//               // Placeholder widget or loading indicator when data is not available yet
//               return Center(
//                 child: Text("Erro${snapshot.error}"),
//               ); // Or any other widget
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ));
//   }
// }
//
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/foundation.dart';
// //
// // final FirebaseStorage _storage = FirebaseStorage.instance;
// // final FirebaseStorage _fireStore = FirebaseStorage.instance;
// //
// // class StoreData {
// //   Future<String> uplodeImagetoStorage(String childname, Uint8List file) async {
// //     Reference ref = _storage.ref().child(childname);
// //     UploadTask uploadTask = ref.putData(file);
// //     TaskSnapshot snapshot = await uploadTask;
// //     await snapshot.ref.getDownloadURL();
// //     return downlodUrl;
// //   }
// //
// //   Future<String> saveData({
// //     required Uint8List file,
// //   }) async {
// //     String resp = "some Erro Occured";
// //     try {
// //       String imageUrl = await uplodeImagetoStorage('profileImage', file);
// //       await _fireStore.collection('userProfil').add({'imageLink': imageUrl});
// //       resp = 'success';
// //     } catch (err) {
// //       resp = err.toString();
// //     }
// //     return resp;
// //   }
// // }
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:image_picker/image_picker.dart';
// //
// // pickImage(ImageSource source) async {
// //   final ImagePicker _imagePicker = ImagePicker();
// //   XFile? _file = await _imagePicker.pickImage(source: source);
// //
// //   if (_file != null) {
// //     return await _file.readAsBytes();
// //   }
// //   print('No Image  selected');
// // }
// //
// // final FirebaseStorage _storage = FirebaseStorage.instance;
// //
// // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //
// // class StoreData {
// //   Future<String> uplodeimageToStorage(String childName, Uint8List file) async {
// //     Reference ref = _storage.ref().child(childName);
// //     UploadTask uploadTask = ref.putData(file);
// //     TaskSnapshot snapshot = await uploadTask;
// //     String downloadUrl = await snapshot.ref.getDownloadURL();
// //     return downloadUrl;
// //   }
// //
// //   Future<String> saveData({
// //     required String name,
// //     required String bio,
// //     required Uint8List file,
// //   }) async {
// //     String resp = " some erro";
// //     try {
// //       String imageUrl = ''; // Declare imageUrl outside the if block
// //       if (name.isNotEmpty || bio.isNotEmpty)
// //         imageUrl = await uplodeimageToStorage('profilImage', file);
// //
// //       await _firestore.collection('Users').add({
// //         'name': name,
// //         'bio': bio,
// //         'imagelink': imageUrl,
// //       });
// //       resp = 'success';
// //     } catch (err) {
// //       resp = err.toString();
// //     }
// //     return resp;
// //   }
// // }
