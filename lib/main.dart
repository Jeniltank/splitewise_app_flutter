import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/Start_Screen/expanceScreen.dart';
import 'package:splitewise_flutter/firebase_options.dart';
import 'package:splitewise_flutter/introScreen/My_Homepage.dart';
//import 'package:todo_firestor/firebase_options.dart';
//import 'package:todo_firestor/ui/spalsh_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// await FirebaseAppCheck.instance.activate(
//   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
// );

pickImage(Type imageSource, source) {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: FutureBuilder(
        future: checkAuthState(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (snapshot.data == true) {
                return ExpenseScreen();
              } else {
                return MyHomePage();
              }
            }
          }
        },
      ),
    );
  }

  Future<bool> checkAuthState() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser != null;
  }
}
