import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splitewise_flutter/Start_Screen/expanceScreen.dart';
import 'package:splitewise_flutter/Widgets/RoundButton.dart';
import 'package:splitewise_flutter/firebase_login_or_signup/SignupScreen.dart';
import 'package:splitewise_flutter/firebase_login_or_signup/login_with_mobilnumber.dart';
import 'package:splitewise_flutter/utils/utills.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loding = false;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void dispos() {
    super.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
  }

  void login(BuildContext context) {
    setState(() {
      loding = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passcontroller.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TabbarScreen(),
        ),
      );
      setState(() {
        loding = false;
      });
    }).catchError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loding = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Login Screen'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/animaction/loginm.json'),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        helperText: 'Enter abc@gmail.com',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter gemil';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passcontroller,
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
                height: 10,
              ),
              // RoundButton(
              //   title: 'Login',
              //   loding: loding,
              //   onTap: () {
              //     if (_formKey.currentState!.validate()) {
              //       login(context);
              //     }
              //   },
              // ),
              RoundButton(
                title: 'Login',
                loading: loding,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    login(context);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              RoundButton(
                  title: 'Login with mobil Number ',
                  loading: loding,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MobileNumberScreen(),
                        ));
                  }),

              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dot't have Account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text("Sign Up"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
