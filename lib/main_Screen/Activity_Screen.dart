//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Activity',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('expenses').snapshots(),
      //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error: ${snapshot.error}'),
      //       );
      //     }
      //     // If there are no expenses, show a message
      //     if (snapshot.data!.docs.isEmpty) {
      //       return Center(
      //         child: Text('No expenses found.'),
      //       );
      //     }
      //     // If there are expenses, display them in a list
      //     return ListView.builder(
      //       itemCount: snapshot.data!.docs.length,
      //       itemBuilder: (context, index) {
      //         var expense = snapshot.data!.docs[index];
      //         return ListTile(
      //           title: Text(expense['description']),
      //           subtitle: Text('Amount: \₹${expense['totalAmount']}'),
      //           // You can display more details of the expense here
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
