import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart'; // Import the intl package

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Activity',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection("Activity")
            .where('userId',
                isEqualTo: currentUserId) // Filter activities by userId
            // .orderBy("timestamp", descending: true)
            .snapshots(),
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
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: documents.length,
            separatorBuilder: (context, index) =>
                Divider(), // Add a separator between items
            itemBuilder: (context, index) {
              final message = documents[index]['message'] ?? 'No Message';
              final timestamp =
                  documents[index]['timestamp'] ?? Timestamp.now();
              final dateTime = (timestamp as Timestamp).toDate();
              return ListTile(
                title: Text(
                  message,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(dateTime)}', // Use DateFormat to format the date
                ),
              );
            },
          );
        },
      ),
    );
  }
}
