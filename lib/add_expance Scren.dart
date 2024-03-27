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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Assuming you have a function to get group members stream
import 'group_Screen_Child/group_Listview_data.dart';

class AddExpenseScreen extends StatefulWidget {
  final String groupId;
  final String groupName; // Variable to hold the group name
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
            StreamBuilder(
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
                            // Assuming you want to select members here
                            onTap: () {
                              // Toggle member selection
                              setState(() {
                                if (widget.groupMembers.contains(username)) {
                                  widget.groupMembers.remove(username);
                                } else {
                                  widget.groupMembers.add(username);
                                }
                              });
                            },
                            // Assuming you want to show selected members differently
                            trailing: Icon(
                              widget.groupMembers.contains(username)
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addExpense();
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }

  void _addExpense() async {
    String description = _descriptionController.text;
    double totalAmount = double.parse(_amountController.text);

    // Calculate individual share for each member
    double individualShare = totalAmount / widget.groupMembers.length;

    // Create a map to store individual shares
    Map<String, double> individualShares = {};
    for (String member in widget.groupMembers) {
      individualShares[member] = individualShare;
    }

    // Get the current server timestamp
    final currentTimeStamp = FieldValue.serverTimestamp();

    // Store the expense details in Firestore with timestamp
    await FirebaseFirestore.instance.collection('expenses').add({
      'groupId': widget.groupId,
      'groupName': widget.groupName, // Include the group name
      'totalAmount': totalAmount,
      'individualShares': individualShares,
      'description': description,
      'timestamp': currentTimeStamp, // Include the timestamp
      // Add other necessary details if needed
    });

    // Show a message indicating expense added successfully
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense added successfully!'),
      ),
    );

    // Optionally, you can navigate back to the previous screen
    Navigator.pop(context);
  }
}
