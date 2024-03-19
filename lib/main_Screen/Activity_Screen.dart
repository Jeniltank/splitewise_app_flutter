import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Activity',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
