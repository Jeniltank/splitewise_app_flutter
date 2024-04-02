// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
// // import 'package:splitewise_flutter/group_Screen_Child/add_Group.dart'
// //     as AddGroupChild; // Use a prefix to disambiguate
// // import 'package:splitewise_flutter/models/group.dart';
// //
// // import '../group_Screen_Child/group_Listview_data.dart';
// //
// // class GroupScreen extends StatefulWidget {
// //   final String userId;
// //
// //   const GroupScreen({
// //     Key? key,
// //     required this.userId,
// //     required List groups,
// //     required String groupType,
// //     required String groupName,
// //   }) : super(key: key);
// //
// //   @override
// //   State<GroupScreen> createState() => _GroupScreenState();
// // }
// //
// // class _GroupScreenState extends State<GroupScreen> {
// //   final DatabaseServiceForAddGroup _databaseService =
// //       DatabaseServiceForAddGroup();
// //   List<Group> group = [
// //     Group(
// //         groupName: "GroupName",
// //         groupType: "GroupType",
// //         creatorUserId: "CreatorUserId")
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black87,
// //       appBar: AppBar(
// //         backgroundColor: Colors.green,
// //         automaticallyImplyLeading: false,
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.search, color: Colors.white),
// //             onPressed: () {
// //               // Add your onPressed logic for the search icon here
// //             },
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.group, color: Colors.white),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) =>
// //                       AddGroupChild.AddGroup(), // Use the prefix
// //                 ),
// //               );
// //             },
// //           ),
// //         ],
// //         centerTitle: true,
// //         title: Text(
// //           "Group Screen",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             SizedBox(
// //               height: 30,
// //             ),
// //             Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.green,
// //                 border: Border.all(color: Colors.green),
// //                 borderRadius: BorderRadius.circular(8.0),
// //               ),
// //               child: TextButton.icon(
// //                 onPressed: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) =>
// //                           AddGroupChild.AddGroup(), // Use the prefix
// //                     ),
// //                   );
// //                 },
// //                 icon: Icon(
// //                   Icons.group,
// //                   color: Colors.white,
// //                 ),
// //                 label: Text(
// //                   "Start new Group",
// //                   style: TextStyle(color: Colors.white, fontSize: 20),
// //                 ),
// //                 style: TextButton.styleFrom(
// //                   backgroundColor: Colors.transparent,
// //                   padding:
// //                       EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Expanded(
// //               child: StreamBuilder<List<Group>>(
// //                 stream: _databaseService.getGroups(),
// //                 builder: (context, snapshot) {
// //                   if (snapshot.hasError) {
// //                     return Center(
// //                       child: Text('Error: ${snapshot.error}'),
// //                     );
// //                   }
// //                   if (snapshot.connectionState == ConnectionState.waiting) {
// //                     return Center(
// //                       child: CircularProgressIndicator(),
// //                     );
// //                   }
// //                   List<Group>? groups = snapshot.data;
// //                   if (groups == null || groups.isEmpty) {
// //                     return Center(
// //                       child: Text('No Groups Found'),
// //                     );
// //                   }
// //
// //                   // Get current user's ID using Firebase Authentication
// //                   User? currentUser = FirebaseAuth.instance.currentUser;
// //                   String? currentUserID = currentUser?.uid;
// //
// //                   List<Group> userGroups = groups
// //                       .where((group) => group.creatorUserId == currentUserID)
// //                       .toList();
// //
// //                   if (userGroups.isEmpty) {
// //                     return Center(
// //                       child: Text('You haven\'t created any groups yet.'),
// //                     );
// //                   }
// //
// //                   return ListView.builder(
// //                     itemCount: userGroups.length,
// //                     itemBuilder: (context, index) {
// //                       Group group = userGroups[index];
// //                       return Card(
// //                         color: Colors.green,
// //                         elevation: 2,
// //                         margin:
// //                             EdgeInsets.symmetric(vertical: 5, horizontal: 5),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                         child: ListTile(
// //                           contentPadding: EdgeInsets.symmetric(
// //                               vertical: 20, horizontal: 20),
// //                           leading: Icon(
// //                             Icons.group,
// //                             color: Colors.white,
// //                           ),
// //                           title: Text(
// //                             group.groupName,
// //                             style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 18,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           subtitle: Text(
// //                             'Type: ${group.groupType}',
// //                             style: TextStyle(
// //                               fontStyle: FontStyle.italic,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           trailing: Row(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: [
// //                               IconButton(
// //                                 icon: Icon(
// //                                   Icons.delete,
// //                                   color: Colors.white,
// //                                 ),
// //                                 onPressed: () async {
// //                                   // Add delete functionality here
// //                                   bool confirmed = await showDialog(
// //                                     context: context,
// //                                     builder: (context) => AlertDialog(
// //                                       title: Text("Confirm Deletion"),
// //                                       content: Text(
// //                                           "Are you sure you want to delete this group?"),
// //                                       actions: [
// //                                         TextButton(
// //                                           onPressed: () {
// //                                             Navigator.pop(context,
// //                                                 false); // Return false if cancel
// //                                           },
// //                                           child: Text("Cancel"),
// //                                         ),
// //                                         TextButton(
// //                                           onPressed: () {
// //                                             Navigator.pop(context,
// //                                                 true); // Return true if confirmed
// //                                           },
// //                                           child: Text("Delete"),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   );
// //                                   // if (confirmed == true) {
// //                                   //   // Perform delete operation from Firestore
// //                                   //   try {
// //                                   //     await _databaseService.deleteGroup(group
// //                                   //         .groupId); // Assuming you have a deleteGroup method in your database service
// //                                   //     // Optionally, you can show a success message or update the UI
// //                                   //   } catch (error) {
// //                                   //     // Handle errors here
// //                                   //     print("Error deleting group: $error");
// //                                   //     // Optionally, you can show an error message to the user
// //                                   //   }
// //                                   // }
// //                                 },
// //                               ),
// //
// //                               // Icon(
// //                               //   Icons.arrow_forward,
// //                               //   color: Colors.white,
// //                               // ),
// //                             ],
// //                           ),
// //                           onTap: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) => GroupListView(
// //                                   groupName: group.groupName,
// //                                   groupType: group.groupType,
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
// import 'package:splitewise_flutter/group_Screen_Child/add_Group.dart'
//     as AddGroupChild; // Use a prefix to disambiguate
// import 'package:splitewise_flutter/models/group.dart';
//
// import '../group_Screen_Child/group_Listview_data.dart';
//
// class GroupScreen extends StatefulWidget {
//   final String userId;
//
//   const GroupScreen({
//     Key? key,
//     required this.userId,
//     required List groups,
//     required String groupType,
//     required String groupName,
//   }) : super(key: key);
//
//   @override
//   State<GroupScreen> createState() => _GroupScreenState();
// }
//
// class _GroupScreenState extends State<GroupScreen> {
//   final DatabaseServiceForAddGroup _databaseService =
//       DatabaseServiceForAddGroup();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             onPressed: () {
//               // Add your onPressed logic for the search icon here
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.group, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       AddGroupChild.AddGroup(), // Use the prefix
//                 ),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//         title: Text(
//           "Group Screen",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 border: Border.all(color: Colors.green),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: TextButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           AddGroupChild.AddGroup(), // Use the prefix
//                     ),
//                   );
//                 },
//                 icon: Icon(
//                   Icons.group,
//                   color: Colors.white,
//                 ),
//                 label: Text(
//                   "Start new Group",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   padding:
//                       EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder<List<Group>>(
//                 stream: _databaseService.getGroups(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error: ${snapshot.error}'),
//                     );
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   List<Group>? groups = snapshot.data;
//                   if (groups == null || groups.isEmpty) {
//                     return Center(
//                       child: Text('No Groups Found'),
//                     );
//                   }
//
//                   // Get current user's ID using Firebase Authentication
//                   User? currentUser = FirebaseAuth.instance.currentUser;
//                   String? currentUserID = currentUser?.uid;
//
//                   List<Group> userGroups = groups
//                       .where((group) => group.creatorUserId == currentUserID)
//                       .toList();
//
//                   if (userGroups.isEmpty) {
//                     return Center(
//                       child: Text('You haven\'t created any groups yet.'),
//                     );
//                   }
//
//                   return ListView.builder(
//                     itemCount: userGroups.length,
//                     itemBuilder: (context, index) {
//                       Group group = userGroups[index];
//                       return Card(
//                         color: Colors.green,
//                         elevation: 2,
//                         margin:
//                             EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 20),
//                           leading: Icon(
//                             Icons.group,
//                             color: Colors.white,
//                           ),
//                           title: Text(
//                             group.groupName,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Text(
//                             'Type: ${group.groupType}',
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               color: Colors.white,
//                             ),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.delete,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () async {
//                                   bool confirmed = await showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: Text("Confirm Deletion"),
//                                       content: Text(
//                                           "Are you sure you want to delete this group?"),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context,
//                                                 false); // Return false if cancel
//                                           },
//                                           child: Text("Cancel"),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context,
//                                                 true); // Return true if confirmed
//                                           },
//                                           child: Text("Delete"),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                   if (confirmed == true) {
//                                     // Perform delete operation from Firestore
//                                     try {
//                                       await _databaseService.deleteGroup(group
//                                           .groupId); // Assuming you have a deleteGroup method in your database service
//                                     } catch (error) {
//                                       // Handle errors here
//                                       print("Error deleting group: $error");
//                                       // Optionally, you can show an error message to the user
//                                     }
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => GroupListView(
//                                   groupName: group.groupName,
//                                   groupType: group.groupType,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
// import 'package:splitewise_flutter/group_Screen_Child/add_Group.dart'
//     as AddGroupChild; // Use a prefix to disambiguate
// import 'package:splitewise_flutter/models/group.dart';
//
// class GroupScreen extends StatefulWidget {
//   final String userId;
//
//   const GroupScreen({
//     Key? key,
//     required this.userId,
//     required List groups,
//     required String groupType,
//     required String groupName,
//   }) : super(key: key);
//
//   @override
//   State<GroupScreen> createState() => _GroupScreenState();
// }
//
// class _GroupScreenState extends State<GroupScreen> {
//   final DatabaseServiceForAddGroup _databaseService =
//       DatabaseServiceForAddGroup();
//   final FirebaseFirestore _firestore =
//       FirebaseFirestore.instance; // Firestore instance
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _firestore.collection('groups').doc(groupId).delete();
//     } catch (error) {
//       print('Error deleting group: $error');
//       throw error;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             onPressed: () {
//               // Add your onPressed logic for the search icon here
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.group, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       AddGroupChild.AddGroup(), // Use the prefix
//                 ),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//         title: Text(
//           "Group Screen",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 border: Border.all(color: Colors.green),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: TextButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           AddGroupChild.AddGroup(), // Use the prefix
//                     ),
//                   );
//                 },
//                 icon: Icon(
//                   Icons.group,
//                   color: Colors.white,
//                 ),
//                 label: Text(
//                   "Start new Group",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   padding:
//                       EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder<List<Group>>(
//                 stream: _databaseService.getGroups(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error: ${snapshot.error}'),
//                     );
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   List<Group>? groups = snapshot.data;
//                   if (groups == null || groups.isEmpty) {
//                     return Center(
//                       child: Text('No Groups Found'),
//                     );
//                   }
//
//                   // Get current user's ID using Firebase Authentication
//                   User? currentUser = FirebaseAuth.instance.currentUser;
//                   String? currentUserID = currentUser?.uid;
//
//                   List<Group> userGroups = groups
//                       .where((group) => group.creatorUserId == currentUserID)
//                       .toList();
//
//                   if (userGroups.isEmpty) {
//                     return Center(
//                       child: Text('You haven\'t created any groups yet.'),
//                     );
//                   }
//
//                   return ListView.builder(
//                     itemCount: userGroups.length,
//                     itemBuilder: (context, index) {
//                       Group group = userGroups[index];
//                       return Card(
//                         color: Colors.green,
//                         elevation: 2,
//                         margin:
//                             EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 20),
//                           leading: Icon(
//                             Icons.group,
//                             color: Colors.white,
//                           ),
//                           title: Text(
//                             group.groupName,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Text(
//                             'Type: ${group.groupType}',
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               color: Colors.white,
//                             ),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.delete,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () async {
//                                   bool confirmed = await showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: Text("Confirm Deletion"),
//                                       content: Text(
//                                           "Are you sure you want to delete this group?"),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context, false);
//                                           },
//                                           child: Text("Cancel"),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context, true);
//                                           },
//                                           child: Text("Delete"),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                   if (confirmed == true) {
//                                     try {
//                                       await deleteGroup(group
//                                           .groupId); // Pass the groupId here
//                                     } catch (error) {
//                                       print("Error deleting group: $error");
//                                     }
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
// import 'package:splitewise_flutter/group_Screen_Child/add_Group.dart'
//     as AddGroupChild;
// import 'package:splitewise_flutter/models/group.dart';
//
// class GroupScreen extends StatefulWidget {
//   final String userId;
//
//   const GroupScreen({
//     Key? key,
//     required this.userId,
//     required List<Group> groups,
//     required String groupType,
//     required String groupName,
//   }) : super(key: key);
//
//   @override
//   State<GroupScreen> createState() => _GroupScreenState();
// }
//
// class _GroupScreenState extends State<GroupScreen> {
//   final DatabaseServiceForAddGroup _databaseService =
//       DatabaseServiceForAddGroup();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _firestore.collection('groups').doc(groupId).delete();
//       print('Group deleted successfully: $groupId');
//     } catch (error) {
//       print('Error deleting group: $error');
//       throw error;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             onPressed: () {
//               // Add your onPressed logic for the search icon here
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.group, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AddGroupChild.AddGroup(),
//                 ),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//         title: Text(
//           "Group Screen",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 border: Border.all(color: Colors.green),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: TextButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddGroupChild.AddGroup(),
//                     ),
//                   );
//                 },
//                 icon: Icon(
//                   Icons.group,
//                   color: Colors.white,
//                 ),
//                 label: Text(
//                   "Start new Group",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   padding:
//                       EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: StreamBuilder<List<Group>>(
//                 stream: _databaseService.getGroups(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error: ${snapshot.error}'),
//                     );
//                   }
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   List<Group>? groups = snapshot.data;
//                   if (groups == null || groups.isEmpty) {
//                     return Center(
//                       child: Text('No Groups Found'),
//                     );
//                   }
//
//                   User? currentUser = FirebaseAuth.instance.currentUser;
//                   String? currentUserID = currentUser?.uid;
//
//                   List<Group> userGroups = groups
//                       .where((group) => group.creatorUserId == currentUserID)
//                       .toList();
//
//                   if (userGroups.isEmpty) {
//                     return Center(
//                       child: Text('You haven\'t created any groups yet.'),
//                     );
//                   }
//
//                   return ListView.builder(
//                     itemCount: userGroups.length,
//                     itemBuilder: (context, index) {
//                       Group group = userGroups[index];
//                       return Card(
//                         color: Colors.green,
//                         elevation: 2,
//                         margin:
//                             EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 20),
//                           leading: Icon(
//                             Icons.group,
//                             color: Colors.white,
//                           ),
//                           title: Text(
//                             group.groupName,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Text(
//                             'Type: ${group.groupType}',
//                             style: TextStyle(
//                               fontStyle: FontStyle.italic,
//                               color: Colors.white,
//                             ),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.delete,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () async {
//                                   bool confirmed = await showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: Text("Confirm Deletion"),
//                                       content: Text(
//                                           "Are you sure you want to delete this group?"),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context, false);
//                                           },
//                                           child: Text("Cancel"),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context, true);
//                                           },
//                                           child: Text("Delete"),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                   if (confirmed == true) {
//                                     try {
//                                       await deleteGroup(group
//                                           .groupId); // Pass the groupId here
//                                     } catch (error) {
//                                       print("Error deleting group: $error");
//                                     }
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
import 'package:splitewise_flutter/group_Screen_Child/add_Group.dart'
    as AddGroupChild;
import 'package:splitewise_flutter/group_Screen_Child/group_Listview_data.dart';
import 'package:splitewise_flutter/models/group.dart';

class GroupScreen extends StatefulWidget {
  final String userId;

  const GroupScreen({
    Key? key,
    required this.userId,
    required List groups,
    required String groupName,
    required String groupType,
  }) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final DatabaseServiceForAddGroup _databaseService =
      DatabaseServiceForAddGroup();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late List<String> friends; // Define friends list

  Future<void> deleteGroup(String groupId) async {
    try {
      await _firestore.collection('groups').doc(groupId).delete();
      print('Group deleted successfully: $groupId');
    } catch (error) {
      print('Error deleting group: $error');
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add your onPressed logic for the search icon here
            },
          ),
          IconButton(
            icon: Icon(Icons.group, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddGroupChild.AddGroup(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          "Group Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.teal],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddGroupChild.AddGroup(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.group,
                  color: Colors.white,
                ),
                label: Text(
                  "Start new \n Group",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<Group>>(
                stream: _databaseService.getGroups(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<Group>? groups = snapshot.data;
                  if (groups == null || groups.isEmpty) {
                    return Center(
                      child: Text('No Groups Found',
                          style: TextStyle(color: Colors.white)),
                    );
                  }

                  User? currentUser = FirebaseAuth.instance.currentUser;
                  String? currentUserID = currentUser?.uid;

                  List<Group> userGroups = groups
                      .where((group) => group.creatorUserId == currentUserID)
                      .toList();

                  if (userGroups.isEmpty) {
                    return Center(
                      child: Text('You haven\'t created any groups yet.',
                          style: TextStyle(color: Colors.white)),
                    );
                  }
                  return ListView.builder(
                    itemCount: userGroups.length,
                    itemBuilder: (context, index) {
                      Group group = userGroups[index];
                      IconData iconData;
                      switch (group.groupType.toLowerCase()) {
                        case 'trip':
                          iconData = Icons
                              .airplanemode_active; // Change to the trip icon
                          break;
                        case 'food':
                          iconData = Icons.fastfood; // Change to the food icon
                          break;
                        default:
                          iconData = Icons.group; // Default icon
                      }
                      return Card(
                        color: Colors.teal,
                        elevation: 4,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(iconData,
                                color:
                                    Colors.black), // Set the icon dynamically
                          ),
                          // Prefix icon
                          title: Text(
                            group.groupName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            group.groupType,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              // Ensure groupId is not null before attempting deletion
                              if (group.groupId != null) {
                                // Assuming groupId is a String, if it's not, adjust accordingly
                                deleteGroup(group
                                    .groupId!); // Use ! to assert non-nullability
                              } else {
                                // Handle null groupId case
                                print('Group ID is null. Unable to delete.');
                              }
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroupListView(
                                  groupName: group.groupName,
                                  groupId: group.groupId!,
                                  groupType: group.groupType,
                                  groupMembers: [],
                                  //groupMembers: [],
                                  // friends:
                                  //  group.groupMembers, groupMembers: [], // Use group members
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GroupScreen(
      userId: '', groups: [], groupName: '',
      groupType: '', // Pass your user ID here
    ),
  ));
}
