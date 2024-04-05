// import 'package:flutter/material.dart';
//
// class Expancemain extends StatefulWidget {
//   //final Group group;
//   const Expancemain({super.key});
//
//   @override
//   State<Expancemain> createState() => _ExpancemainState();
// }
//
// class _ExpancemainState extends State<Expancemain> {
//   void onSearch() async {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text(
//           "Expance Cart ",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
//
// // class Expancemain extends StatefulWidget {
// //   const Expancemain({
// //     Key? key,
// //     required this.friendsValue,
// //     required this.tip,
// //     required this.tax,
// //     required this.bill,
// //   }) : super(key: key);
// //
// //   final double friendsValue;
// //   final double tip;
// //   final String tax;
// //   final String bill;
// //
// //   @override
// //   State<Expancemain> createState() => _ExpancemainState();
// // }
//
// // class _ExpancemainState extends State<Expancemain> {
// //   String divideamount = ''; // Initialize divideamount as a String
// //
// //   @override
// //   void initState() {
// //     // Call divideAmount() instead of divideamount()
// //     divideAmount();
// //     super.initState();
// //   }
// //
// // // Rename the function to divideAmount() with proper return type and parameters
// //   void divideAmount() {
// //     double taxamount =
// //         double.parse(widget.bill) * (double.parse(widget.tax) / 100);
// //     double finalbill = (double.parse(widget.bill) + taxamount + widget.tip) /
// //         widget.friendsValue;
// //     setState(() {
// //       divideamount = finalbill.toStringAsFixed(2);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black87,
// //       appBar: AppBar(
// //         title: Text('Split Bill Result '),
// //         backgroundColor: Colors.green,
// //         automaticallyImplyLeading: false,
// //         centerTitle: true,
// //       ),
// //       body: Container(
// //         margin: EdgeInsets.only(left: 20, right: 20),
// //         child: Column(
// //           //mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               alignment: Alignment.centerLeft,
// //               margin: EdgeInsets.only(top: 40),
// //               child: Text(
// //                 "Result",
// //                 style: TextStyle(
// //                     fontWeight: FontWeight.w700,
// //                     fontSize: 20,
// //                     color: Colors.white),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             Container(
// //               width: MediaQuery.of(context).size.width,
// //               height: 120,
// //               decoration: BoxDecoration(color: Colors.green),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(15),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           "Equally Divided",
// //                           style: TextStyle(
// //                               fontSize: 20,
// //                               fontWeight: FontWeight.w700,
// //                               color: Colors.white),
// //                         ),
// //                         Text(
// //                           "\₹$divideamount",
// //                           style: TextStyle(
// //                               fontSize: 30,
// //                               fontWeight: FontWeight.w700,
// //                               color: Colors.white),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(15.0),
// //                     child: Row(
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "Friend",
// //                               style: TextStyle(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white),
// //                             ),
// //                             Text(
// //                               "Tax",
// //                               style: TextStyle(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white),
// //                             ),
// //                             Text(
// //                               "Tip",
// //                               style: TextStyle(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white),
// //                             ),
// //                           ],
// //                         ),
// //                         SizedBox(
// //                           width: 10,
// //                         ),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               widget.friendsValue.round().toString(),
// //                               style: TextStyle(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white),
// //                             ),
// //                             Text(
// //                               "${widget.tax}%",
// //                               style: TextStyle(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white),
// //                             ),
// //                             Text(
// //                               "\₹${widget.tip.round().toString()}",
// //                               style: TextStyle(
// //                                   fontSize: 20,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: Colors.white),
// //                             ),
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class Expense {
//   final String description;
//   final double totalAmount;
//   final Map<String, dynamic> individualShares;
//
//   Expense(this.description, this.totalAmount, this.individualShares);
// }
//
// class ExpenseMainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text(
//           "Expense Chart",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('expenses').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }
//
//           final currentUser = FirebaseAuth.instance.currentUser;
//           if (currentUser == null) {
//             // Handle case where currentUser is null
//             return Center(
//               child: Text('User not authenticated'),
//             );
//           }
//           print(currentUser.uid);
//
//           // Filter expenses based on user ID in individualShares
//           List<Expense> userExpenses = snapshot.data!.docs
//               .map((DocumentSnapshot doc) {
//                 return Expense(
//                   doc['description'],
//                   doc['totalAmount'],
//                   // Initialize individualShares as an empty map if it's null or not of type Map<String, dynamic>
//                   (doc['individualShares'] != null &&
//                           doc['individualShares'] is Map<String, dynamic>)
//                       ? doc['individualShares']
//                       : {},
//                 );
//               })
//               .where((expense) =>
//                   expense.individualShares.keys.contains(currentUser.uid))
//               .toList();
//
//           // Create a series for the pie chart
//           var series = [
//             charts.Series(
//               id: 'Expenses',
//               data: userExpenses,
//               domainFn: (Expense expense, _) => expense.description,
//               measureFn: (Expense expense, _) => expense.totalAmount,
//               labelAccessorFn: (Expense expense, _) =>
//                   '\₹${expense.totalAmount}',
//             ),
//           ];
//
//           // Create the pie chart
//           var chart = charts.PieChart(
//             series,
//             animate: true,
//           );
//
//           // Return the chart wrapped in a ChartWidget
//           return Column(
//             children: [
//               SizedBox(
//                 height: 250,
//                 child: chart,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: userExpenses.length,
//                   itemBuilder: (context, index) {
//                     var expense = userExpenses[index];
//                     return Card(
//                       color: Colors.teal,
//                       elevation: 3,
//                       margin: EdgeInsets.symmetric(
//                         vertical: 5,
//                         horizontal: 16,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(0),
//                         child: ListTile(
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 16,
//                           ),
//                           title: Text(
//                             expense.description,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Amount: ₹${expense.totalAmount}',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               if (expense.individualShares != null)
//                                 ...expense.individualShares.entries
//                                     .map((entry) {
//                                   if (entry.key == currentUser.uid) {
//                                     return Text(
//                                       '${entry.key}: ₹${entry.value}',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         color: Colors.white,
//                                       ),
//                                     );
//                                     // // } else if (entry.value.containsValue(
//                                     // //     "U82Ek1MAo1aoApDEvBKsUlUuX5G2")) {
//                                     // return Text(
//                                     //   '${entry.key}: ₹${entry.value}',
//                                     //   style: TextStyle(
//                                     //     fontSize: 16,
//                                     //     color: Colors.white,
//                                     //   ),
//                                     // );
//                                   } else {
//                                     return SizedBox.shrink();
//                                   }
//                                 }),
//                             ],
//                           ),
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.white,
//                             child: Icon(Icons.currency_rupee_outlined),
//                           ),
//                           trailing: IconButton(
//                             icon: Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             ),
//                             onPressed: () {
//                               _deleteExpense(expense);
//                             },
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// void _deleteExpense(Expense expense) async {
//   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//       .collection('expenses')
//       .where('description', isEqualTo: expense.description)
//       .where('totalAmount', isEqualTo: expense.totalAmount)
//       .limit(1)
//       .get();
//
//   querySnapshot.docs.first.reference.delete();
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ExpenseMainScreen(),
//   ));
// }
// //////////*****************************************************************//////////////////
//
// // import 'package:charts_flutter/flutter.dart' as charts;
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class Expense {
// //   final String description;
// //   final double totalAmount;
// //   final Map<String, dynamic>? individualShares;
// //
// //   Expense(this.description, this.totalAmount, this.individualShares);
// // }
// //
// // class ExpenseMainScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.teal,
// //         automaticallyImplyLeading: false,
// //         centerTitle: true,
// //         title: Text(
// //           "Expense Chart",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //       ),
// //       body: StreamBuilder(
// //         stream: FirebaseFirestore.instance.collection('expenses').snapshots(),
// //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           }
// //           if (snapshot.hasError) {
// //             return Center(
// //               child: Text('Error: ${snapshot.error}'),
// //             );
// //           }
// //
// //           final currentUser = FirebaseAuth.instance.currentUser;
// //           if (currentUser == null) {
// //             return Center(
// //               child: Text('User not authenticated'),
// //             );
// //           }
// //
// //           List<Expense> userExpenses = snapshot.data!.docs
// //               .map((DocumentSnapshot doc) {
// //                 var individualShares = doc['individualShares'];
// //                 return Expense(
// //                   doc['description'],
// //                   doc['totalAmount']?.toDouble() ?? 0.0,
// //                   (individualShares is Map<String, dynamic>)
// //                       ? individualShares
// //                       : null,
// //                 );
// //               })
// //               .where((expense) =>
// //                   expense.individualShares != null &&
// //                   expense.individualShares!.keys.contains(currentUser.uid))
// //               .toList();
// //
// //           print('User Expenses: ${userExpenses.length}');
// //
// //           var series = [
// //             charts.Series(
// //               id: 'Expenses',
// //               data: userExpenses,
// //               domainFn: (Expense expense, _) => expense.description,
// //               measureFn: (Expense expense, _) => expense.totalAmount,
// //               labelAccessorFn: (Expense expense, _) =>
// //                   '\₹${expense.totalAmount}',
// //             ),
// //           ];
// //
// //           var chart = charts.PieChart(
// //             series,
// //             animate: true,
// //           );
// //
// //           return Column(
// //             children: [
// //               SizedBox(
// //                 height: 250,
// //                 child: chart,
// //               ),
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: userExpenses.length,
// //                   itemBuilder: (context, index) {
// //                     var expense = userExpenses[index];
// //                     return Card(
// //                       color: Colors.teal,
// //                       elevation: 3,
// //                       margin: EdgeInsets.symmetric(
// //                         vertical: 5,
// //                         horizontal: 16,
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(0),
// //                         child: ListTile(
// //                           contentPadding: EdgeInsets.symmetric(
// //                             vertical: 12,
// //                             horizontal: 16,
// //                           ),
// //                           title: Text(
// //                             expense.description,
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           subtitle: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 'Amount: ₹${expense.totalAmount}',
// //                                 style: TextStyle(
// //                                   fontSize: 16,
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                               if (expense.individualShares != null)
// //                                 ...expense.individualShares!.entries
// //                                     .map((entry) {
// //                                   if (entry.key == currentUser.uid) {
// //                                     return Text(
// //                                       '${entry.key}: ₹${entry.value}',
// //                                       style: TextStyle(
// //                                         fontSize: 16,
// //                                         color: Colors.white,
// //                                       ),
// //                                     );
// //                                   } else {
// //                                     return SizedBox.shrink();
// //                                   }
// //                                 }),
// //                             ],
// //                           ),
// //                           leading: CircleAvatar(
// //                             backgroundColor: Colors.white,
// //                             child: Icon(Icons.attach_money),
// //                           ),
// //                           trailing: IconButton(
// //                             icon: Icon(
// //                               Icons.delete,
// //                               color: Colors.red,
// //                             ),
// //                             onPressed: () {
// //                               _deleteExpense(expense);
// //                             },
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // void _deleteExpense(Expense expense) async {
// //   try {
// //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
// //         .collection('expenses')
// //         .where('description', isEqualTo: expense.description)
// //         .where('totalAmount', isEqualTo: expense.totalAmount)
// //         .limit(1)
// //         .get();
// //
// //     if (querySnapshot.docs.isNotEmpty) {
// //       querySnapshot.docs.first.reference.delete();
// //     }
// //   } catch (e) {
// //     print('Error deleting expense: $e');
// //   }
// // }
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: ExpenseMainScreen(),
// //   ));
// // }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Expense {
  final String description;
  final double totalAmount;
  final List<Map<String, dynamic>> individualShares;

  Expense(this.description, this.totalAmount, this.individualShares);
}

class ExpenseMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Expense Chart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('expenses').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Get the current user's ID
          final currentUser = FirebaseAuth.instance.currentUser;
          final currentUserId = currentUser?.uid;

          // Convert expenses from Firestore to Expense objects
          List<Expense> expenses =
              snapshot.data!.docs.map((DocumentSnapshot doc) {
            // Check if individualShares exists and is of the correct type
            List<Map<String, dynamic>> individualShares = [];
            if (doc['individualShares'] is List<dynamic>) {
              individualShares = List<Map<String, dynamic>>.from(
                  doc['individualShares'] as List<dynamic>);
            }
            return Expense(
              doc['description'],
              doc['totalAmount'],
              individualShares,
            );
          }).toList();

          // Filter expenses to show only those where the current user is included in individual shares
          expenses = expenses.where((expense) {
            return expense.individualShares
                .any((share) => share['userId'] == currentUserId);
          }).toList();

          // Calculate total amount spent by the user based on individual shares
          double totalAmountSpentByUser = expenses.fold(0, (previous, current) {
            double userShare = current.individualShares.firstWhere(
                (share) => share['userId'] == currentUserId,
                orElse: () => {'share': 0})['share'];
            return previous + userShare;
          });

          // Create a list of PieChartSectionData
          List<Color> sectionColors = [
            // Colors.red,
            Colors.blue,
            Colors.green,
            Colors.orange,
            Colors.purple,
            // Add more colors as needed
          ];

          List<PieChartSectionData> pieChartSections = [];
          for (int i = 0; i < expenses.length; i++) {
            final Color color = sectionColors[i %
                sectionColors
                    .length]; // Cycle through colors if there are more sections than colors
            final expense = expenses[i];
            final sectionData = PieChartSectionData(
              value: expense.totalAmount,
              title: '${expense.description}\n\₹${expense.totalAmount}',
              color: color,
              radius: 70,
            );
            pieChartSections.add(sectionData);
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Amount Spent by ${currentUser?.displayName ?? 'You'}: ₹$totalAmountSpentByUser',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: PieChart(
                  PieChartData(
                    sections: pieChartSections,
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    var expense = expenses[index];
                    return Card(
                      color: Colors.teal,
                      elevation: 3,
                      margin: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 16,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              title: Text(
                                expense.description,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Amount: ₹${expense.totalAmount}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (expense.individualShares != null &&
                                      expense.individualShares.isNotEmpty)
                                    ...expense.individualShares
                                        .where((share) =>
                                            share['userId'] == currentUserId)
                                        .map((individualShare) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Username: ${individualShare['username']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Share: ₹${individualShare['share']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                        ],
                                      );
                                    }).toList(),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.currency_rupee_sharp),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _deleteExpense(expense);
                                },
                              ),
                            ),
                            // Spacer between ListTile and Button
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _showSettleUpDialog(context, expense);
                                },
                                child: Text(
                                  'Settle up',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showSettleUpDialog(
      BuildContext context, Expense expense) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settle Up'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to settle up this expense?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Settle Up'),
              onPressed: () {
                _deleteExpense(expense);
                Navigator.of(context).pop();
                _showSettleUpSuccessDialog(context);

                // Store "Settle Up Successful" message in the "Activity" collection
                _storeActivityMessage(
                    'Expense "${expense.description}" Settle-Up successfully');
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSettleUpSuccessDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settle Up Successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Lottie.asset('assets/animaction/paymentsucceful.json'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // Add activity to the 'Activity' collection
                //_addSettleUpActivity();
              },
            ),
          ],
        );
      },
    );
  }

  // Future<void> _addSettleUpActivity() async {
  //   try {
  //     // Store activity in the 'Activity' collection
  //     await FirebaseFirestore.instance.collection('Activity').add({
  //       'message': 'Expense settled  up successfully',
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     print('Error adding settle up activity: $e');
  //     // Handle error while adding activity
  //   }
  // }

  void _deleteExpense(Expense expense) async {
    try {
      // Retrieve the expense document to be deleted
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('expenses')
          .where('description', isEqualTo: expense.description)
          .where('totalAmount', isEqualTo: expense.totalAmount)
          .limit(1)
          .get();

      // Delete the expense document
      querySnapshot.docs.first.reference.delete();

      // Store the deleted expense details in a shared collection accessible to all users
      await FirebaseFirestore.instance.collection('deleted_expenses').add({
        'description': expense.description,
        'totalAmount': expense.totalAmount,
        'deletedBy': FirebaseAuth.instance.currentUser
            ?.uid, // Store the user who deleted the expense
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Store activity in the 'Activity' collection
      await FirebaseFirestore.instance.collection('Activity').add({
        'message': 'Expense "${expense.description}" deleted successfully',
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error deleting expense: $e');
      // Handle error while deleting expense
    }
  }

  void _storeActivityMessage(String message) async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Store the current user's name and user ID along with the message
        await FirebaseFirestore.instance.collection('Activity').add({
          'message': message,
          'userId': currentUser.uid,
          'userName': currentUser.displayName,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        print('Error: Current user is null.');
      }
    } catch (e) {
      print('Error storing activity message: $e');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: ExpenseMain(),
  ));
}
