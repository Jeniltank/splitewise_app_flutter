import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intropage2 extends StatefulWidget {
  const Intropage2({super.key});

  @override
  State<Intropage2> createState() => _Intropage2State();
}

class _Intropage2State extends State<Intropage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation
            Lottie.asset("assets/animaction/friend.json"),
            SizedBox(height: 20), // Adding space between animation and text
            // Text below the animation
            Text(
              'Split However  You Want \n       Share Cost Equllay',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
