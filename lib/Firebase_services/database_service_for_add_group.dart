// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// const String GROUP_COLLECTION_REF = "groups";
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final CollectionReference _groupRef;
//
//   DatabaseServiceForAddGroup() {
//     _groupRef =
//         _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
//               fromFirestore: (snapshot, _) => Group.fromJson(snapshot.data()!),
//               toFirestore: (group, _) => group.toJson(),
//             );
//   }
//
//   Future<void> addGroup(Group group) async {
//     try {
//       // Convert Group object to Map
//       Map<String, dynamic> groupData = group.toJson();
//       // Add the group data to Firestore
//       await _groupRef.add(groupData);
//     } catch (e) {
//       print('Error adding group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroupsForUser(String userId) {
//     return _groupRef.where('creatorUserId', isEqualTo: userId).snapshots().map(
//           (querySnapshot) =>
//               querySnapshot.docs.map((doc) => doc.data() as Group).toList(),
//         );
//   }
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _groupRef.doc(groupId).delete();
//       print('Group deleted successfully');
//     } catch (e) {
//       print('Error deleting group: $e');
//       throw e;
//     }
//   }
//
//   getGroups() {}
//
// // Other methods like updateGroup, getGroupsForUser...
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// const String GROUP_COLLECTION_REF = "groups";
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final CollectionReference<Group> _groupRef;
//
//   DatabaseServiceForAddGroup() {
//     _groupRef =
//         _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
//               fromFirestore: (snapshot, _) => Group.fromJson(snapshot.data()!),
//               toFirestore: (group, _) => group.toJson(),
//             );
//   }
//
//   Future<void> addGroup(
//       Group group, String userId, BuildContext context) async {
//     try {
//       // Set creatorUserId to the provided userId
//       group.creatorUserId = userId;
//       await _groupRef.add(group);
//     } catch (e) {
//       print('Error adding group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroupsForUser(String userId) {
//     try {
//       return _groupRef
//           .where('creatorUserId', isEqualTo: userId)
//           .snapshots()
//           .map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups for user: $e');
//       throw e;
//     }
//   }
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _groupRef.doc(groupId).delete();
//       print('Group deleted successfully');
//     } catch (e) {
//       print('Error deleting group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroups() {
//     try {
//       return _groupRef.snapshots().map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups: $e');
//       throw e;
//     }
//   }
//
//   getUserId(String userEmail) {}
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// const String GROUP_COLLECTION_REF = "groups";
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final CollectionReference<Group> _groupRef;
//
//   DatabaseServiceForAddGroup() {
//     _groupRef =
//         _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
//               fromFirestore: (snapshot, _) => Group.fromJson(snapshot.data()!),
//               toFirestore: (group, _) => group.toJson(),
//             );
//   }
//
//   Future<void> addGroup(Group group, String userId) async {
//     try {
//       // Set creatorUserId to the provided userId
//       group.creatorUserId = userId;
//       await _groupRef.add(group);
//     } catch (e) {
//       print('Error adding group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroupsForUser(String userId) {
//     try {
//       return _groupRef
//           .where('creatorUserId', isEqualTo: userId)
//           .snapshots()
//           .map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups for user: $e');
//       throw e;
//     }
//   }
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _groupRef.doc(groupId).delete();
//       print('Group deleted successfully');
//     } catch (e) {
//       print('Error deleting group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroups() {
//     try {
//       return _groupRef.snapshots().map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups: $e');
//       throw e;
//     }
//   }
//
//   Future<String> getUserId(String userEmail) async {
//     try {
//       // Implement your logic here to retrieve the user ID based on the userEmail
//       // For example, you might query your user collection in Firestore
//       // and retrieve the user document based on the provided email
//       // Then, extract and return the user ID
//       // Replace the return statement below with your actual logic
//       String userId = "user123"; // Replace "user123" with the actual user ID
//       return userId;
//     } catch (e) {
//       print('Error getting user ID: $e');
//       throw e;
//     }
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// const String GROUP_COLLECTION_REF = "groups";
// const String USERS_COLLECTION_REF = "users";
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final CollectionReference<Group> _groupRef;
//   late final CollectionReference _userRef;
//
//   DatabaseServiceForAddGroup() {
//     _groupRef =
//         _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
//               fromFirestore: (snapshot, _) => Group.fromJson(snapshot.data()!),
//               toFirestore: (group, _) => group.toJson(),
//             );
//
//     _userRef = _firestore.collection(USERS_COLLECTION_REF);
//   }
//
//   Future<void> addGroup(
//       Group group, String userEmail, BuildContext context) async {
//     try {
//       String userId = await getUserId(userEmail);
//       if (userId.isNotEmpty) {
//         // Set creatorUserId to the retrieved userId
//         group.creatorUserId = userId;
//         await _groupRef.add(group);
//       } else {
//         // Show an alert dialog if user ID is not found for the provided email
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('User ID not found for email: $userEmail'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(); // Close the dialog
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } catch (e) {
//       print('Error adding group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroupsForUser(String userEmail) {
//     try {
//       return _groupRef
//           .where('creatorUserId', isEqualTo: getUserId(userEmail))
//           .snapshots()
//           .map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups for user: $e');
//       throw e;
//     }
//   }
//
//   Future<String> getUserId(String userEmail) async {
//     try {
//       // Query the Users collection to retrieve the user document based on the userEmail
//       QuerySnapshot userSnapshot =
//           await _userRef.where('email', isEqualTo: userEmail).limit(1).get();
//
//       if (userSnapshot.docs.isNotEmpty) {
//         // Extract and return the user ID
//         return userSnapshot.docs.first.id;
//       } else {
//         return ''; // Return empty string if user not found
//       }
//     } catch (e) {
//       print('Error getting user ID: $e');
//       throw e;
//     }
//   }
//
//   deleteGroup(String groupId) {}
//
//   getGroups() {}
//
// // Other methods like deleteGroup, getGroups...
// }
// **********************************************************************//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// const String GROUP_COLLECTION_REF = "groups";
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final CollectionReference<Group> _groupRef;
//
//   DatabaseServiceForAddGroup() {
//     _groupRef =
//         _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
//               fromFirestore: (snapshot, _) => Group.fromJson(snapshot.data()!),
//               toFirestore: (group, _) => group.toJson(),
//             );
//   }
//
//   Future<void> addGroup(Group group) async {
//     try {
//       await _groupRef.add(group);
//     } catch (e) {
//       print('Error adding group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroupsForUser(String userId) {
//     try {
//       return _groupRef
//           .where('creatorUserId', isEqualTo: userId)
//           .snapshots()
//           .map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups for user: $e');
//       throw e;
//     }
//   }
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _groupRef.doc(groupId).delete();
//       print('Group deleted successfully');
//     } catch (e) {
//       print('Error deleting group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroups() {
//     try {
//       return _groupRef.snapshots().map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups: $e');
//       throw e;
//     }
//   }
//
//   Future<String> getUserId(String userEmail) async {
//     try {
//       // Implement your logic here to retrieve the user ID based on the userEmail
//       // For example, you might query your user collection in Firestore
//       // and retrieve the user document based on the provided email
//       // Then, extract and return the user ID
//       // Replace the return statement below with your actual logic
//       String userId = "user123"; // Replace "user123" with the actual user ID
//       return userId;
//     } catch (e) {
//       print('Error getting user ID: $e');
//       throw e;
//     }
//   }
// }
//***********************************************************************************
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// const String GROUP_COLLECTION_REF = "groups";
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late final CollectionReference<Group> _groupRef;
//
//   DatabaseServiceForAddGroup() {
//     _groupRef =
//         _firestore.collection(GROUP_COLLECTION_REF).withConverter<Group>(
//               fromFirestore: (snapshot, _) => Group.fromJson(snapshot.data()!),
//               toFirestore: (group, _) => group.toJson(),
//             );
//   }
//
//   Future<void> addGroup(Group group, String userId) async {
//     try {
//       // Set creatorUserId to the provided userId
//       group.creatorUserId = FirebaseAuth.instance.currentUser?.uid ?? "";
//       // Add the group to Firestore, Firestore will generate a unique ID
//       await _groupRef.add(group);
//     } catch (e) {
//       print('Error adding group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroupsForUser(String userId) {
//     try {
//       return _groupRef
//           .where('creatorUserId', isEqualTo: userId)
//           .snapshots()
//           .map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups for user: $e');
//       throw e;
//     }
//   }
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       await _groupRef.doc(groupId).delete();
//       print('Group deleted successfully');
//     } catch (e) {
//       print('Error deleting group: $e');
//       throw e;
//     }
//   }
//
//   Stream<List<Group>> getGroups() {
//     try {
//       return _groupRef.snapshots().map(
//             (querySnapshot) =>
//                 querySnapshot.docs.map((doc) => doc.data()).toList(),
//           );
//     } catch (e) {
//       print('Error getting groups: $e');
//       throw e;
//     }
//   }
//
//   //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<String?> getUserId(String userEmail) async {
//     try {
//       // Query the 'users' collection to find the document with the provided email
//       QuerySnapshot snapshot = await _firestore
//           .collection('users')
//           .where('email', isEqualTo: userEmail)
//           .get();
//
//       // Check if a document with the provided email exists
//       if (snapshot.docs.isNotEmpty) {
//         // Extract the user ID from the document data
//         String userId = snapshot.docs.first.id;
//         return userId;
//       } else {
//         // If no document matches the provided email, return null or throw an error
//         // Return null for now, handle error as needed in your application
//         return null;
//       }
//     } catch (e) {
//       print('Error getting user ID: $e');
//       throw e;
//     }
//   }
//
//   getUserIdFromUsersCollection() {}
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Method to add a group to Firestore
//   Future<void> addGroup(Group group, String userId) async {
//     try {
//       // Add group data to Firestore
//       await _firestore.collection('groups').add({
//         'groupName': group.groupName,
//         'groupType': group.groupType,
//         'creatorUserId': group.creatorUserId,
//       });
//     } catch (error) {
//       // Handle any errors that occur during the process
//       print('Error adding group to Firestore: $error');
//       throw error; // Rethrow the error for proper error handling
//     }
//   }
//
//   // Method to fetch user ID from Firestore
//   Future<String> getUserIdFromUsersCollection(String groupName) async {
//     try {
//       // Get the current user from Firebase Authentication
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // Return the user's ID
//         return user.uid;
//       } else {
//         // If the user is not logged in, handle the case accordingly
//         print('User is not logged in.');
//         throw Exception('User is not logged in.');
//       }
//     } catch (error) {
//       print('Error fetching user ID: $error');
//       throw error;
//     }
//   }
//
//   // Method to get groups from Firestore
//   Stream<List<Group>> getGroups() {
//     try {
//       // Stream to listen for changes in the groups collection
//       return _firestore.collection('groups').snapshots().map((snapshot) {
//         return snapshot.docs.map((doc) {
//           return Group(
//             groupName: doc['groupName'],
//             groupType: doc['groupType'],
//             groupId: doc.id,
//             creatorUserId: doc['creatorUserId'],
//           );
//         }).toList();
//       });
//     } catch (error) {
//       print('Error fetching groups: $error');
//       throw error;
//     }
//   }
//
//   deleteGroup(String groupId) {}
//
//   getGroupsForUser(String userId) {}
//
//   String? getCurrentUserID() {
//     try {
//       // Get the current user from Firebase Authentication
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // Return the user's ID
//         return user.uid;
//       } else {
//         // If the user is not logged in, return null
//         print('User is not logged in.');
//         return null;
//       }
//     } catch (error) {
//       print('Error getting current user ID: $error');
//       return null;
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// class DatabaseServiceForAddGroup {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> addGroup(Group group, String userId) async {
//     try {
//       await _firestore.collection('groups').add({
//         'groupName': group.groupName,
//         'groupType': group.groupType,
//         'creatorUserId': group.creatorUserId,
//       });
//     } catch (error) {
//       print('Error adding group to Firestore: $error');
//       throw error;
//     }
//   }
//
//   Future<String> getUserIdFromUsersCollection(String groupName) async {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         return user.uid;
//       } else {
//         print('User is not logged in.');
//         throw Exception('User is not logged in.');
//       }
//     } catch (error) {
//       print('Error fetching user ID: $error');
//       throw error;
//     }
//   }
//
//   Stream<List<Group>> getGroups() {
//     try {
//       return _firestore.collection('groups').snapshots().map((snapshot) {
//         return snapshot.docs.map((doc) {
//           return Group(
//             groupName: doc['groupName'],
//             groupType: doc['groupType'],
//             //groupId: doc.id,
//             creatorUserId: doc['creatorUserId'], groupId: '',
//           );
//         }).toList();
//       });
//     } catch (error) {
//       print('Error fetching groups: $error');
//       throw error;
//     }
//   }
//
//   Future<void> deleteGroup(String groupId) async {
//     try {
//       if (groupId.isNotEmpty) {
//         await _firestore.collection('groups').doc(groupId).delete();
//         print('Group deleted successfully: $groupId');
//       } else {
//         print('Error deleting group: Group ID is empty');
//       }
//     } catch (error) {
//       print('Error deleting group: $error');
//       throw error;
//     }
//   }
//
//   getGroupsForUser(String userId) {}
//
//   String? getCurrentUserID() {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         return user.uid;
//       } else {
//         print('User is not logged in.');
//         return null;
//       }
//     } catch (error) {
//       print('Error getting current user ID: $error');
//       return null;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splitewise_flutter/models/group.dart';

class DatabaseServiceForAddGroup {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<void> addGroup(Group group, String userId) async {
  //   try {
  //     await _firestore.collection('groups').add({
  //       'groupName': group.groupName,
  //       'groupType': group.groupType,
  //       'creatorUserId': group.creatorUserId,
  //     });
  //   } catch (error) {
  //     print('Error adding group to Firestore: $error');
  //     throw error;
  //   }
  // }
  Future<String> addGroup(Group group, String userId) async {
    try {
      CollectionReference groupsCollection =
          FirebaseFirestore.instance.collection('groups');
      DocumentReference groupDoc =
          groupsCollection.doc(); // Automatically generates a unique ID
      group.groupId = groupDoc.id; // Assign the generated ID to the group

      await groupDoc
          .set(group.toJson()); // Save the group with its generated ID

      // Add the group ID to the user's document
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'groups': FieldValue.arrayUnion([groupDoc.id]),
      });

      return groupDoc.id;
    } catch (e) {
      print('Error adding group: $e');
      throw e;
    }
  }

  Future<String> getUserIdFromUsersCollection(String groupName) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user.uid;
      } else {
        print('User is not logged in.');
        throw Exception('User is not logged in.');
      }
    } catch (error) {
      print('Error fetching user ID: $error');
      throw error;
    }
  }

  Stream<List<Group>> getGroups() {
    try {
      return _firestore.collection('groups').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return Group(
            groupName: doc['groupName'],
            groupType: doc['groupType'],
            groupId: doc.id, // Assuming groupId is required.
            creatorUserId: doc['creatorUserId'], groupMembers: [],
          );
        }).toList();
      });
    } catch (error) {
      print('Error fetching groups: $error');
      throw error;
    }
  }

  Future<void> deleteGroup(String groupId) async {
    try {
      await _firestore.collection('groups').doc(groupId).delete();
      print('Group deleted successfully: $groupId');
    } catch (error) {
      print('Error deleting group: $error');
      throw error;
    }
  }

  getGroupsForUser(String userId) {}

  String? getCurrentUserID() {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user.uid;
      } else {
        print('User is not logged in.');
        return null;
      }
    } catch (error) {
      print('Error getting current user ID: $error');
      return null;
    }
  }
}
