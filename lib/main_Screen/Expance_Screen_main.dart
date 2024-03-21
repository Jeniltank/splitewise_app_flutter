import 'package:flutter/material.dart';
//import 'package:splitewise_flutter/main_Screen_Child/Add_friends.dart';
import 'package:splitewise_flutter/group_Screen_Child/Add_friends.dart';

class Expancemain extends StatefulWidget {
  //final Group group;
  const Expancemain({super.key});

  @override
  State<Expancemain> createState() => _ExpancemainState();
}

class _ExpancemainState extends State<Expancemain> {
  void onSearch() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black87,
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
            icon: Icon(Icons.group_add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFriends(
                      targetGroup: "",
                    ),
                  ));
              // Add your onPressed logic for the group icon here
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          " Friends",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal, // Set the background color of the container
                border: Border.all(color: Colors.cyan), // Border
                borderRadius: BorderRadius.circular(8.0), // Border radius
              ),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddFriends(
                        targetGroup: '',
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.group_add,
                  color: Colors.white,
                ),
                label: Text(
                  "Add Friends",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors
                      .transparent, // Set transparent background for the button
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Expancemain extends StatefulWidget {
//   const Expancemain({
//     Key? key,
//     required this.friendsValue,
//     required this.tip,
//     required this.tax,
//     required this.bill,
//   }) : super(key: key);
//
//   final double friendsValue;
//   final double tip;
//   final String tax;
//   final String bill;
//
//   @override
//   State<Expancemain> createState() => _ExpancemainState();
// }

// class _ExpancemainState extends State<Expancemain> {
//   String divideamount = ''; // Initialize divideamount as a String
//
//   @override
//   void initState() {
//     // Call divideAmount() instead of divideamount()
//     divideAmount();
//     super.initState();
//   }
//
// // Rename the function to divideAmount() with proper return type and parameters
//   void divideAmount() {
//     double taxamount =
//         double.parse(widget.bill) * (double.parse(widget.tax) / 100);
//     double finalbill = (double.parse(widget.bill) + taxamount + widget.tip) /
//         widget.friendsValue;
//     setState(() {
//       divideamount = finalbill.toStringAsFixed(2);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         title: Text('Split Bill Result '),
//         backgroundColor: Colors.green,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//       ),
//       body: Container(
//         margin: EdgeInsets.only(left: 20, right: 20),
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               alignment: Alignment.centerLeft,
//               margin: EdgeInsets.only(top: 40),
//               child: Text(
//                 "Result",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,
//                     color: Colors.white),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 120,
//               decoration: BoxDecoration(color: Colors.green),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Equally Divided",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white),
//                         ),
//                         Text(
//                           "\₹$divideamount",
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Friend",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white),
//                             ),
//                             Text(
//                               "Tax",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white),
//                             ),
//                             Text(
//                               "Tip",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.friendsValue.round().toString(),
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white),
//                             ),
//                             Text(
//                               "${widget.tax}%",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white),
//                             ),
//                             Text(
//                               "\₹${widget.tip.round().toString()}",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
