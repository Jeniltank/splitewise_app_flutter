import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splitewise_flutter/firebase_login_or_signup/loginPage.dart';
import 'package:splitewise_flutter/introScreen/Intro_page_2.dart';
import 'package:splitewise_flutter/introScreen/Intro_page_3.dart';
import 'package:splitewise_flutter/introScreen/intro_page_1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // checkAuthState();
  }

  // Future<void> checkAuthState() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   if (auth.currentUser != null) {
  //     // User is already logged in, navigate to ExpenseScreen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => ExpenseScreen()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            children: const [
              Intropage1(),
              Intropage2(),
              Intropage3(),
            ],
          ),
          // Dot indicator and buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  currentPageIndex == 2
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
