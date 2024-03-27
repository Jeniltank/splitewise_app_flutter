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
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Expense {
  final String description;
  final double totalAmount;

  Expense(this.description, this.totalAmount);
}

class Expancemain extends StatelessWidget {
  const Expancemain({Key? key}) : super(key: key);

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

          // Convert expenses from Firestore to Expense objects
          List<Expense> expenses =
              snapshot.data!.docs.map((DocumentSnapshot doc) {
            return Expense(doc['description'], doc['totalAmount']);
          }).toList();

          // Create a series for the pie chart
          var series = [
            charts.Series(
              id: 'Expenses',
              data: expenses,
              domainFn: (Expense expense, _) => expense.description,
              measureFn: (Expense expense, _) => expense.totalAmount,
              labelAccessorFn: (Expense expense, _) =>
                  '\₹${expense.totalAmount}',
            ),
          ];

          // Create the pie chart
          var chart = charts.PieChart(
            series,
            animate: true,
          );

          // Return the chart wrapped in a ChartWidget
          return Column(
            children: [
              SizedBox(
                height: 250,
                child: chart,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    var expense = expenses[index];

                    // Assuming currentUserIndex is the index of the current user in the individualShares list
                    // double currentUserShare =
                    //     expense.individualShares[currentUserIndex];

                    return Card(
                      color: Colors.teal,
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(0), // Set padding to 0
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
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
                                    fontSize: 16, color: Colors.white),
                              ),
                              // Display individual share for the current user
                              // Text(
                              //   'Your Share: ₹$currentUserShare', // Adjust text according to your requirement
                              //   style: TextStyle(
                              //       fontSize: 16, color: Colors.white),
                              // ),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.currency_rupee_outlined),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _deleteExpense(
                                  expense); // Call the function to delete the expense
                            },
                          ),
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
}

void _deleteExpense(Expense expense) async {
  // Find the expense document in Firestore
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('expenses')
      .where('description', isEqualTo: expense.description)
      .where('totalAmount', isEqualTo: expense.totalAmount)
      .limit(1)
      .get();

  // Delete the found document
  querySnapshot.docs.first.reference.delete();
}

void main() {
  runApp(MaterialApp(
    home: Expancemain(),
  ));
}
