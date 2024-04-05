import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/main_Screen/Activity_Screen.dart';
import 'package:splitewise_flutter/main_Screen/Expance_Screen_main.dart';
import 'package:splitewise_flutter/main_Screen/Group_Screen.dart';

import '../main_Screen/profil_screen.dart';

//import 'package:get/get.dart';
class TabbarScreen extends StatefulWidget {
  const TabbarScreen({key}) : super(key: key);

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  int currentIndex = 0; // Change 'index' to 'currentIndex'
  final List<Widget> screens = [
    GroupScreen(
      userId: '',
      groups: [],
      groupName: '',
      groupType: '',
    ),
    ExpenseMain(),
    ActivityScreen(),
    ProfilScreen(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex], // Use currentIndex here
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        color: Colors.teal,
        backgroundColor: Colors.transparent,
        items: [
          Icon(
            Icons.group,
            color: Colors.white,
          ),
          Icon(
            Icons.add_chart,
            color: Colors.white,
          ),
          //Text("Goup"),
          //  Icon(Icons.add, color: Colors.white),
          Icon(Icons.credit_card, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/main_Screen/Activity_Screen.dart';
// import 'package:splitewise_flutter/main_Screen/Expance_Screen_main.dart';
// import 'package:splitewise_flutter/main_Screen/Group_Screen.dart';
//
// import '../main_Screen/profil_screen.dart';
//
// class TabbarScreen extends StatefulWidget {
//   const TabbarScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TabbarScreen> createState() => _TabbarScreenState();
// }
//
// class _TabbarScreenState extends State<TabbarScreen> {
//   int currentIndex = 0;
//   final List<Widget> screens = [
//     GroupScreen(
//       userId: '',
//       groups: [],
//       groupName: '',
//       groupType: '',
//     ),
//     ExpenseMain(),
//     ActivityScreen(),
//     ProfilScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: screens[currentIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.teal,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               spreadRadius: 1,
//               blurRadius: 10,
//               offset: Offset(0, -1),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           currentIndex: currentIndex,
//           onTap: (index) => setState(() => currentIndex = index),
//           backgroundColor: Colors
//               .transparent, // Set the background color of the navigation bar to transparent
//           selectedItemColor: Colors.teal,
//           unselectedItemColor: Colors.teal,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.group),
//               label: 'Groups',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.pie_chart),
//               label: 'Expenses',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.credit_card),
//               label: 'Activity',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
