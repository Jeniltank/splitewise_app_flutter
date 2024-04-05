// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class AddExpenseScreen extends StatefulWidget {
//   final String groupId;
//   final String groupName; // Assuming you have a variable to hold the group name
//   final List<String> groupMembers;
//
//   const AddExpenseScreen({
//     Key? key,
//     required this.groupId,
//     required this.groupName,
//     required this.groupMembers,
//   }) : super(key: key);
//
//   @override
//   _AddExpenseScreenState createState() => _AddExpenseScreenState();
// }
//
// class _AddExpenseScreenState extends State<AddExpenseScreen> {
//   TextEditingController _amountController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Add Expense'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Enter Description:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Enter Expense Amount:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _amountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the amount';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _addExpense();
//               },
//               child: Text('Add Expense'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _addExpense() async {
//     String description = _descriptionController.text;
//     double totalAmount = double.parse(_amountController.text);
//
//     // Calculate individual share
//     double individualShare = totalAmount / widget.groupMembers.length;
//
//     // Store the expense details in Firestore
//     await FirebaseFirestore.instance.collection('expenses').add({
//       'groupId': widget.groupId,
//       'groupName': widget.groupName, // Include the group name
//       'totalAmount': totalAmount,
//       'individualShare': individualShare,
//       'description': description,
//       // Add other necessary details if needed
//     });
//
//     // Show a message indicating expense added successfully
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Expense added successfully!'),
//       ),
//     );
//
//     // Optionally, you can navigate back to the previous screen
//     Navigator.pop(context);
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class AddExpenseScreen extends StatefulWidget {
//   final String groupId;
//   final String groupName; // Assuming you have a variable to hold the group name
//   final List<String> groupMembers;
//
//   const AddExpenseScreen({
//     Key? key,
//     required this.groupId,
//     required this.groupName,
//     required this.groupMembers,
//   }) : super(key: key);
//
//   @override
//   _AddExpenseScreenState createState() => _AddExpenseScreenState();
// }
//
// class _AddExpenseScreenState extends State<AddExpenseScreen> {
//   TextEditingController _amountController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   List<String> selectedMembers = []; // To store selected group members
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Add Expense'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Enter Description:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Enter Expense Amount:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _amountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the amount';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Select Group Member:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.groupMembers.length,
//                 itemBuilder: (context, index) {
//                   var member = widget.groupMembers[index];
//                   bool isSelected = selectedMembers.contains(member);
//                   return ListTile(
//                     title: Text(member),
//                     onTap: () {
//                       setState(() {
//                         if (isSelected) {
//                           selectedMembers.remove(member);
//                         } else {
//                           selectedMembers.add(member);
//                         }
//                       });
//                     },
//                     trailing: Icon(
//                       isSelected ? Icons.check_circle : Icons.circle_outlined,
//                       color: isSelected ? Colors.green : null,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _addExpense();
//               },
//               child: Text('Add Expense'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _addExpense() async {
//     String description = _descriptionController.text;
//     double totalAmount = double.parse(_amountController.text);
//
//     // Calculate individual share
//     double individualShare = totalAmount / selectedMembers.length;
//
//     // Get the current server timestamp
//     final currentTimeStamp = FieldValue.serverTimestamp();
//
//     // Store the expense details in Firestore with timestamp
//     await FirebaseFirestore.instance.collection('expenses').add({
//       'groupId': widget.groupId,
//       'groupName': widget.groupName, // Include the group name
//       'totalAmount': totalAmount,
//       'individualShare': individualShare,
//       'description': description,
//       'timestamp': currentTimeStamp, // Include the timestamp
//       // Add other necessary details if needed
//     });
//
//     // Show a message indicating expense added successfully
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Expense added successfully!'),
//       ),
//     );
//
//     // Optionally, you can navigate back to the previous screen
//     Navigator.pop(context);
//   }
// }
//********************************************************************/////////////
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// // Assuming you have a function to get group members stream
// import 'group_Screen_Child/group_Listview_data.dart';
//
// class AddExpenseScreen extends StatefulWidget {
//   final String groupId;
//   final String groupName; // Variable to hold the group name
//   final List<String> groupMembers;
//
//   const AddExpenseScreen({
//     Key? key,
//     required this.groupId,
//     required this.groupName,
//     required this.groupMembers,
//   }) : super(key: key);
//
//   @override
//   _AddExpenseScreenState createState() => _AddExpenseScreenState();
// }
//
// class _AddExpenseScreenState extends State<AddExpenseScreen> {
//   TextEditingController _amountController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//
//   Future<String> getUsername(String userId) async {
//     try {
//       // Get the user document from Firestore using userId
//       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .get();
//
//       // Check if the document exists
//       if (userSnapshot.exists) {
//         // Access the 'username' field from the document data
//         return userSnapshot['username'];
//       } else {
//         // If user document doesn't exist, return an empty string
//         return '';
//       }
//     } catch (e) {
//       // Handle any errors that occur during the Firestore operation
//       print('Error fetching username: $e');
//       // Return null or throw an error, depending on your error handling strategy
//       return ''; // Returning empty string as a fallback
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Add Expense'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Enter Description:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Enter Expense Amount:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _amountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the amount';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Select Group Member:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               // Wrap your ListView.builder with Expanded
//               child: StreamBuilder(
//                 stream: getGroupMembersStream(widget.groupId),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else {
//                     List groupMembers = snapshot.data ?? [];
//                     return ListView.builder(
//                       itemCount: groupMembers.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         String userId = groupMembers[index]['userId'];
//                         String username = groupMembers[index]['username'];
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Card(
//                             elevation: 2,
//                             color: Colors.teal,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 child: Icon(
//                                   Icons.person,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               title: Text(
//                                 username,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               // Assuming you want to select members here
//                               onTap: () {
//                                 // Toggle member selection
//                                 setState(() {
//                                   if (widget.groupMembers.contains(userId)) {
//                                     widget.groupMembers.remove(userId);
//                                   } else {
//                                     widget.groupMembers.add(userId);
//                                   }
//                                 });
//                               },
//                               // Assuming you want to show selected members differently
//                               trailing: Icon(
//                                 widget.groupMembers.contains(userId)
//                                     ? Icons.check_circle
//                                     : Icons.radio_button_unchecked,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _addExpense();
//               },
//               child: Text('Add Expense'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// //   // Modify _addExpense() method
// //   // Modify _addExpense() method
// // //   void _addExpense() async {
// // //     // Retrieve the description and total amount from the text controllers
// // //     String description = _descriptionController.text.trim();
// // //     String amountText = _amountController.text.trim();
// // //
// // //     // Check if the description and amount fields are empty
// // //     if (description.isEmpty || amountText.isEmpty) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Please enter both description and amount.'),
// // //         ),
// // //       );
// // //       return; // Exit the function early
// // //     }
// // //
// // //     // Parse the amount to double
// // //     double totalAmount = double.tryParse(amountText) ?? 0.0;
// // //
// // //     // Check if the total amount is non-positive
// // //     if (totalAmount <= 0.0) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Please enter a valid amount.'),
// // //         ),
// // //       );
// // //       return; // Exit the function early
// // //     }
// // //
// // //     try {
// // //       // Create a map to store individual shares for selected members
// // //       Map<String, dynamic> individualShares = {};
// // //
// // // // Iterate through selected group members
// // //       for (String userId in widget.groupMembers) {
// // //         // Retrieve the username corresponding to the userId
// // //         String username = await getUsername(userId);
// // //         print(username); // Check if username is retrieved correctly
// // //
// // //         // Calculate individual share
// // //         double individualShare = totalAmount / widget.groupMembers.length;
// // //
// // //         // Store individual share in the map with userId as key
// // //         individualShares[userId] = {
// // //           'username': "$username",
// // //           'share': individualShare,
// // //         };
// // //       }
// // //
// // //       // Get the current server timestamp
// // //       final currentTimeStamp = FieldValue.serverTimestamp();
// // //
// // //       // Store the expense details in Firestore
// // //       await FirebaseFirestore.instance.collection('expenses').add({
// // //         'groupId': widget.groupId,
// // //         'groupName': widget.groupName,
// // //         'totalAmount': totalAmount,
// // //         'individualShares': individualShares,
// // //         'description': description,
// // //         'timestamp': currentTimeStamp,
// // //       });
// // //
// // //       // Show a message indicating expense added successfully
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Expense added successfully!'),
// // //         ),
// // //       );
// // //
// // //       // Optionally, you can navigate back to the previous screen
// // //       Navigator.pop(context);
// // //     } catch (e) {
// // //       // Handle any errors that occur during Firestore write
// // //       print('Error adding expense: $e');
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Failed to add expense. Please try again later.'),
// // //         ),
// // //       );
// // //     }
// // //   }
// //
//   void _addExpense() async {
//     // Retrieve the description and total amount from the text controllers
//     String description = _descriptionController.text.trim();
//     String amountText = _amountController.text.trim();
//
//     // Check if the description and amount fields are empty
//     if (description.isEmpty || amountText.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter both description and amount.'),
//         ),
//       );
//       return; // Exit the function early
//     }
//
//     // Parse the amount to double
//     double totalAmount = double.tryParse(amountText) ?? 0.0;
//
//     // Check if the total amount is non-positive
//     if (totalAmount <= 0.0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please enter a valid amount.'),
//         ),
//       );
//       return; // Exit the function early
//     }
//
//     try {
//       // Create a map to store individual shares for selected members
//       Map<String, dynamic> individualShares = {};
//
//       // Iterate through selected group members
//       for (String userId in widget.groupMembers) {
//         // Retrieve the username corresponding to the userId
//         String username = await getUsername(userId);
//
//         // Calculate individual share
//         double individualShare = totalAmount / widget.groupMembers.length;
//
//         // Add the username and individual share to the map
//         individualShares[userId] = {
//           'username': username,
//           'share': individualShare,
//         };
//       }
//
//       // Get the current server timestamp
//       final currentTimeStamp = FieldValue.serverTimestamp();
//
//       // Store the expense details in Firestore
//       await FirebaseFirestore.instance.collection('expenses').add({
//         'groupId': widget.groupId,
//         'groupName': widget.groupName,
//         'totalAmount': totalAmount,
//         'individualShares': individualShares,
//         'description': description,
//         'timestamp': currentTimeStamp,
//         'addedBy': FirebaseAuth.instance.currentUser
//             ?.uid, // Store the UID of the user who added the expense
//       });
//
//       // Show a message indicating expense added successfully
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Expense added successfully!'),
//         ),
//       );
//
//       // Optionally, you can navigate back to the previous screen
//       Navigator.pop(context);
//     } catch (e) {
//       // Handle any errors that occur during Firestore write
//       print('Error adding expense: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to add expense. Please try again later.'),
//         ),
//       );
//     }
//   }

/********************************************************/ //
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/group_Screen_Child/group_Listview_data.dart';

class AddExpenseScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final List<String> groupMembers;

  const AddExpenseScreen({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.groupMembers,
  }) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<Map<String, dynamic>> getUsername(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        String username = userSnapshot['username'];
        if (username.isNotEmpty) {
          return {'userId': userId, 'username': username};
        } else {
          return {'userId': userId, 'username': 'Unknown User'};
        }
      } else {
        return {'userId': userId, 'username': 'Unknown User'};
      }
    } catch (e) {
      print('Error fetching username: $e');
      return {'userId': userId, 'username': 'Unknown User'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter Expense Amount:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the amount';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              'Select Group Member:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: getGroupMembersStream(widget.groupId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List groupMembers = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: groupMembers.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String userId = groupMembers[index]['userId'];
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
                              onTap: () {
                                setState(() {
                                  if (widget.groupMembers.contains(userId)) {
                                    widget.groupMembers.remove(userId);
                                  } else {
                                    widget.groupMembers.add(userId);
                                  }
                                });
                              },
                              trailing: Icon(
                                widget.groupMembers.contains(userId)
                                    ? Icons.check_circle
                                    : Icons.radio_button_unchecked,
                                color: Colors.white,
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
            ElevatedButton(
              onPressed: () {
                _addExpense(widget.groupId); // Pass groupId to _addExpense
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }

  void _addExpense(String userId) async {
    String description = _descriptionController.text.trim();
    String amountText = _amountController.text.trim();

    if (description.isEmpty || amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter both description and amount.'),
        ),
      );
      return;
    }

    double totalAmount = double.tryParse(amountText) ?? 0.0;

    if (totalAmount <= 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid amount.'),
        ),
      );
      return;
    }

    try {
      List<Map<String, dynamic>> individualShares = [];

      for (String userId in widget.groupMembers) {
        Map<String, dynamic> userData = await getUsername(userId);
        String username = userData['username'] ?? 'Unknown User';
        double individualShare = totalAmount / widget.groupMembers.length;
        Map<String, dynamic> shareData = {
          'userId': userId,
          'username': username,
          'share': individualShare,
        };
        individualShares.add(shareData);
      }

      final currentTimeStamp = FieldValue.serverTimestamp();

      await FirebaseFirestore.instance.collection('expenses').add({
        'groupId': widget.groupId,
        'groupName': widget.groupName,
        'totalAmount': totalAmount,
        'individualShares': individualShares,
        'description': description,
        'timestamp': currentTimeStamp,
      });

      // Get current user's username
      // final currentUser = await getUsername(userId);
      // final currentUsername = currentUser['username'];
      //
      // await FirebaseFirestore.instance.collection('Activity').add({
      //   'message': 'Expense added successfully   $description',
      //   'timestamp': currentTimeStamp,
      // });

      // Fetch current user's data including username and userId
      final currentUserData = await getUsername(userId);
      final currentUsername = currentUserData['username'];
      final currentUserId = currentUserData['userId'];

      // Add the activity to the 'Activity' collection
      await FirebaseFirestore.instance.collection('Activity').add({
        'message': 'Expense added "$description" successfully ',
        'userId': userId, // Storing userId along with the activity
        'timestamp': currentTimeStamp,
      });

// Show success message only to the user who added the expense
      if (userId == FirebaseAuth.instance.currentUser?.uid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Expense added "$description" successfully!'),
          ),
        );
      }

      Navigator.pop(context);
    } catch (e) {
      print('Error adding expense: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add expense. Please try again later.'),
        ),
      );
    }
  }
}

//************************-----------RESTRAT-----------------*****************
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// // Assuming you have a function to get group members stream
// import 'group_Screen_Child/group_Listview_data.dart';
//
// class AddExpenseScreen extends StatefulWidget {
//   final String groupId;
//   final String groupName; // Variable to hold the group name
//   final List<String> groupMembers;
//
//   const AddExpenseScreen({
//     Key? key,
//     required this.groupId,
//     required this.groupName,
//     required this.groupMembers,
//   }) : super(key: key);
//
//   @override
//   _AddExpenseScreenState createState() => _AddExpenseScreenState();
// }
//
// class _AddExpenseScreenState extends State<AddExpenseScreen> {
//   TextEditingController _amountController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//
//   // Add this method inside the _AddExpenseScreenState class
//   Future<String> getUsername(String userId) async {
//     // Implement the logic to retrieve the username for the given userId
//     // For example, you can query your Firestore database to get the username
//     // Here's a simplified example assuming you have a 'users' collection in Firestore
//     DocumentSnapshot userSnapshot =
//         await FirebaseFirestore.instance.collection('users').doc(userId).get();
//     if (userSnapshot.exists) {
//       return userSnapshot['username'];
//     } else {
//       return 'Unknown User';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Add Expense'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Enter Description:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Enter Expense Amount:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _amountController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the amount';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Select Group Member:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               // Wrap your ListView.builder with Expanded
//               child: StreamBuilder(
//                 stream: getGroupMembersStream(widget.groupId),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else {
//                     List groupMembers = snapshot.data ?? [];
//                     return ListView.builder(
//                       itemCount: groupMembers.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         String username = groupMembers[index]['username'];
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Card(
//                             elevation: 2,
//                             color: Colors.teal,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 child: Icon(
//                                   Icons.person,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               title: Text(
//                                 username,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               // Assuming you want to select members here
//                               onTap: () {
//                                 // Toggle member selection
//                                 setState(() {
//                                   if (widget.groupMembers.contains(username)) {
//                                     widget.groupMembers.remove(username);
//                                   } else {
//                                     widget.groupMembers.add(username);
//                                   }
//                                 });
//                               },
//                               // Assuming you want to show selected members differently
//                               trailing: Icon(
//                                 widget.groupMembers.contains(username)
//                                     ? Icons.check_circle
//                                     : Icons.radio_button_unchecked,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _addExpense();
//               },
//               child: Text('Add Expense'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Modify _addExpense() method
//   void _addExpense() async {
//     String description = _descriptionController.text;
//     double totalAmount = double.parse(_amountController.text);
//
//     // Create a map to store individual shares for selected members
//     Map<String, dynamic> individualShares = {};
//     for (String memberId in widget.groupMembers) {
//       // Only calculate individual shares for selected members
//       double individualShare = totalAmount / widget.groupMembers.length;
//       individualShares[memberId] = {
//         'share': individualShare,
//       };
//     }
//
//     // Get the current server timestamp
//     final currentTimeStamp = FieldValue.serverTimestamp();
//
//     // Store the expense details in Firestore with timestamp
//     await FirebaseFirestore.instance.collection('expenses').add({
//       'groupId': widget.groupId,
//       'groupName': widget.groupName, // Include the group name
//       'totalAmount': totalAmount,
//       'individualShares': individualShares,
//       'description': description,
//       'timestamp': currentTimeStamp, // Include the timestamp
//       // Add other necessary details if needed
//     });
//
//     // Show a message indicating expense added successfully
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Expense added successfully!'),
//       ),
//     );
//
//     // Optionally, you can navigate back to the previous screen
//     Navigator.pop(context);
//   }
// }
