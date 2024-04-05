// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/firebase_login_or_signup/otpscreen.dart';
//
// class MobileNumberScreen extends StatefulWidget {
//   const MobileNumberScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MobileNumberScreen> createState() => _MobileNumberScreenState();
// }
//
// class _MobileNumberScreenState extends State<MobileNumberScreen> {
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//
//   String _verificationId = '';
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   Future<void> verifyPhoneNumber(String phoneNumber) async {
//     try {
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) {
//           // Automatically sign in when verification is completed
//           signInWithCredential(credential);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           // Handle verification failure
//           print('Verification failed: ${e.message}');
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Verification failed. Please try again later.'),
//             backgroundColor: Colors.red,
//           ));
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           // Save verification ID and navigate to OTP screen
//           setState(() {
//             _verificationId = verificationId;
//           });
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OtpScreen(verificationId: verificationId),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           // Handle code auto-retrieval timeout
//           print('Auto-retrieval timeout: $verificationId');
//         },
//       );
//     } catch (e) {
//       print('Error occurred during phone verification: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('An error occurred during phone verification.'),
//         backgroundColor: Colors.red,
//       ));
//     }
//   }
//
//   Future<void> signInWithCredential(PhoneAuthCredential credential) async {
//     try {
//       // Sign in with the received credential
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       // Navigate to the next screen after successful sign-in
//     } catch (e) {
//       print('Sign-in failed: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Sign-in failed. Please try again later.'),
//         backgroundColor: Colors.red,
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Login',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Lottie.asset(
//               //   'assets/animation/login.json', // Replace with your Lottie file path
//               // ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _nameController,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   labelText: 'Enter your name',
//                   prefixIcon: Icon(Icons.person, color: Colors.teal),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _mobileController,
//                 keyboardType: TextInputType.phone,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   labelText: 'Mobile Number',
//                   prefix: Text(
//                     '+91 ',
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                   prefixIcon: Icon(Icons.phone, color: Colors.teal),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onTap: () {
//                   // Scroll to the top when the mobile number field is tapped
//                   _scrollController.animateTo(
//                     0.0,
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Check if the mobile number is provided and valid
//                   if (_mobileController.text.trim().isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text('Please enter your mobile number.'),
//                       backgroundColor: Colors.red,
//                     ));
//                     return;
//                   }
//                   if (_mobileController.text.trim().length != 10) {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content:
//                           Text('Please enter a valid 10-digit mobile number.'),
//                       backgroundColor: Colors.red,
//                     ));
//                     return;
//                   }
//
//                   // Verify the provided phone number
//                   verifyPhoneNumber('+91${_mobileController.text.trim()}');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.teal,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'Login',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splitewise_flutter/Start_Screen/expanceScreen.dart';age:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splitewise_flutter/Start_Screen/expanceScreen.dart';

//import 'package:splitewise_flutter/Start_Screen/expanceScreen.dart';
import 'package:splitewise_flutter/firebase_login_or_signup/otpscreen.dart';
//import 'package:splitewise_flutter/screens/expense_screen.dart'; // Import your ExpenseScreen

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String _verificationId = '';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Automatically sign in when verification is completed
          signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure
          print('Verification failed: ${e.message}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Verification failed. Please try again later.'),
            backgroundColor: Colors.red,
          ));
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save verification ID and navigate to OTP screen
          setState(() {
            _verificationId = verificationId;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto-retrieval timeout
          print('Auto-retrieval timeout: $verificationId');
        },
      );
    } catch (e) {
      print('Error occurred during phone verification: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred during phone verification.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      // Sign in with the received credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // After successful sign-in, store user data in Firestore
      await storeUserDataInFirestore(
          _nameController.text.trim(), _mobileController.text.trim());

      // Navigate to the ExpenseScreen after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabbarScreen(),
        ),
      );
    } catch (e) {
      print('Sign-in failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sign-in failed. Please try again later.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> storeUserDataInFirestore(
      String name, String mobileNumber) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create a reference to the Firestore collection 'Users'
        CollectionReference users =
            FirebaseFirestore.instance.collection('Users');

        // Add the user's data to Firestore
        await users.doc(user.uid).set({
          'name': name,
          'mobileNumber': mobileNumber,
        });

        print('User data stored in Firestore successfully!');
      } else {
        print('User is null. Unable to store data in Firestore.');
      }
    } catch (e) {
      print('Error storing user data in Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animaction/signup2.json', // Replace with your Lottie file path
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  prefixIcon: Icon(Icons.person, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefix: Text(
                    '+91 ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.phone, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () {
                  // Scroll to the top when the mobile number field is tapped
                  _scrollController.animateTo(
                    0.0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if the mobile number is provided and valid
                  if (_mobileController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter your mobile number.'),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  }
                  if (_mobileController.text.trim().length != 10) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('Please enter a valid 10-digit mobile number.'),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  }

                  // Verify the provided phone number
                  verifyPhoneNumber('+91${_mobileController.text.trim()}');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
