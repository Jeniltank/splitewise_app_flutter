// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:splitewise_flutter/Widgets/RoundButton.dart';
// // import 'package:splitewise_flutter/firebase_login_or_signup/loginPage.dart';
// //
// // class SignUpScreen extends StatefulWidget {
// //   const SignUpScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<SignUpScreen> createState() => _SignUpScreenState();
// // }
// //
// // class _SignUpScreenState extends State<SignUpScreen> {
// //   bool loading = false;
// //   final _formKey = GlobalKey<FormState>();
// //   final emailController = TextEditingController();
// //   final passController = TextEditingController();
// //   FirebaseAuth _auth = FirebaseAuth.instance;
// //
// //   @override
// //   void dispose() {
// //     emailController.dispose();
// //     passController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         title: Center(
// //           child: Text('Sign Up'),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: 60,
// //               ),
// //               Lottie.asset('assets/animaction/signup2.json'),
// //               Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   children: [
// //                     TextFormField(
// //                       keyboardType: TextInputType.emailAddress,
// //                       controller: emailController,
// //                       decoration: const InputDecoration(
// //                         hintText: 'Email',
// //                         helperText: 'Enter abc@gmail.com',
// //                         prefixIcon: Icon(Icons.email),
// //                       ),
// //                       validator: (value) {
// //                         if (value!.isEmpty) {
// //                           return 'Enter email';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(
// //                       height: 20,
// //                     ),
// //                     TextFormField(
// //                       controller: passController,
// //                       obscureText: true,
// //                       decoration: const InputDecoration(
// //                         hintText: 'Password',
// //                         helperText: 'Enter password',
// //                         prefixIcon: Icon(Icons.lock),
// //                       ),
// //                       validator: (value) {
// //                         if (value!.isEmpty) {
// //                           return 'Enter Password';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 20,
// //               ),
// //               RoundButton(
// //                 title: 'Sign Up',
// //                 loading: loading,
// //                 onTap: () async {
// //                   if (_formKey.currentState!.validate()) {
// //                     setState(() {
// //                       loading = true;
// //                     });
// //
// //                     try {
// //                       // Create user in Firebase Auth
// //                       // Create user in Firebase Auth
// //                       UserCredential userCredential =
// //                           await _auth.createUserWithEmailAndPassword(
// //                         email: emailController.text,
// //                         password: passController.text,
// //                       );
// //
// // // Get the user's ID
// //                       String userId = userCredential.user!.uid;
// //
// // // Create "Users" collection if it doesn't exist
// //                       final usersCollection =
// //                           FirebaseFirestore.instance.collection("Users");
// //
// // // Store user data including user ID
// //                       await usersCollection.doc(userId).set({
// //                         'userId': userId, // Add user ID
// //                         'email': emailController.text,
// //                         'username': emailController.text.split('@')[0],
// //                         'bio': 'Empty bio...',
// //                       });
// //
// //                       setState(() {
// //                         loading = false;
// //                       });
// //
// //                       // Navigate to another screen or do something else upon successful signup
// //                     } catch (error) {
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text('Error: $error'),
// //                           duration: Duration(seconds: 3),
// //                         ),
// //                       );
// //                       setState(() {
// //                         loading = false;
// //                       });
// //                     }
// //                   }
// //                 },
// //               ),
// //               SizedBox(
// //                 height: 20,
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text("Already have an Account?"),
// //                   TextButton(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => LoginPage()),
// //                       );
// //                     },
// //                     child: Text("Login"),
// //                   )
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:splitewise_flutter/Widgets/RoundButton.dart';
// import 'package:splitewise_flutter/firebase_login_or_signup/loginPage.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   bool loading = false;
//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Center(
//           child: Text('Sign Up'),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 60,
//               ),
//               Lottie.asset('assets/animaction/signup2.json'),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       controller: emailController,
//                       decoration: const InputDecoration(
//                         hintText: 'Email',
//                         helperText: 'Enter abc@gmail.com',
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: passController,
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         hintText: 'Password',
//                         helperText: 'Enter password',
//                         prefixIcon: Icon(Icons.lock),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Enter Password';
//                         }
//                         return null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RoundButton(
//                 title: 'Sign Up',
//                 loading: loading,
//                 onTap: () async {
//                   if (_formKey.currentState!.validate()) {
//                     setState(() {
//                       loading = true;
//                     });
//
//                     try {
//                       UserCredential userCredential =
//                           await _auth.createUserWithEmailAndPassword(
//                         email: emailController.text,
//                         password: passController.text,
//                       );
//
//                       String userId = userCredential.user!.uid;
//
//                       final usersCollection =
//                           FirebaseFirestore.instance.collection("Users");
//
//                       await usersCollection.doc(userId).set({
//                         'userId': userId,
//                         'email': emailController.text,
//                         'username': emailController.text.split('@')[0],
//                         'bio': 'Empty bio...',
//                       });
//
//                       await userCredential.user!.sendEmailVerification();
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                               'Sign up successful! Please verify your email.'),
//                           duration: Duration(seconds: 3),
//                         ),
//                       );
//
//                       emailController.clear();
//                       passController.clear();
//
//                       setState(() {
//                         loading = false;
//                       });
//
//                       // Navigate to home screen or relevant screen after successful signup
//                     } catch (error) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                               'Failed to sign up. Please try again later.'),
//                           duration: Duration(seconds: 3),
//                         ),
//                       );
//                       setState(() {
//                         loading = false;
//                       });
//                     }
//                   }
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already have an Account?"),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       );
//                     },
//                     child: Text("Login"),
//                   )
//                 ],
//               )
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
import 'package:splitewise_flutter/Widgets/RoundButton.dart';
import 'package:splitewise_flutter/firebase_login_or_signup/loginPage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Sign Up'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Lottie.asset('assets/animaction/signup2.json'),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        helperText: 'Enter abc@gmail.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        helperText: 'Enter password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                title: 'Sign Up',
                loading: loading,
                onTap: _createUser,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("Login"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );

        String userId = userCredential.user!.uid;

        final usersCollection = FirebaseFirestore.instance.collection("Users");

        await usersCollection.doc(userId).set({
          'userId': userId,
          'email': emailController.text,
          'username': emailController.text.split('@')[0],
          'bio': 'Empty bio...',
        });

        await userCredential.user!.sendEmailVerification();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign up successful! Please verify your email.'),
            duration: Duration(seconds: 3),
          ),
        );

        emailController.clear();
        passController.clear();

        setState(() {
          loading = false;
        });

        // Navigate to home screen or relevant screen after successful signup
      } catch (error) {
        String errorMessage = 'Failed to sign up. Please try again later.';
        if (error is FirebaseAuthException) {
          if (error.code == 'email-already-in-use') {
            errorMessage = 'The account already exists for that email.';
          }
          // Handle other specific error cases if needed
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: Duration(seconds: 3),
          ),
        );

        setState(() {
          loading = false;
        });
      }
    }
  }
}
