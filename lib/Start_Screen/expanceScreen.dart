import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/main_Screen/Activity_Screen.dart';
import 'package:splitewise_flutter/main_Screen/Expance_Screen_main.dart';
import 'package:splitewise_flutter/main_Screen/Group_Screen.dart';
import 'package:splitewise_flutter/main_Screen/profil_screen.dart';
//import 'package:splitewise_flutter/main_Screen/profil_screen.dart';
import 'package:splitewise_flutter/main_Screen_Child/spiltBill_Screen.dart';
//import 'package:get/get.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  int currentIndex = 2; // Change 'index' to 'currentIndex'
  final List<Widget> screens = [
    GroupScreen(
      groups: [],
      groupName: '',
      groupType: '',
      userId: '',
    ),
    Expancemain(),
    ActivityScreen(),
    ProfilScreen(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex], // Use currentIndex here
      floatingActionButton: currentIndex != 3 &&
              currentIndex != 0 &&
              currentIndex != 1
          ? Tooltip(
              message: 'Add your expense',
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpliteBill(),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.green.shade800,
                    ),
                    height: 50,
                    width: 160,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add your expense',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null, // Set floatingActionButton to null when currentIndex is 3 (ProfilScreen)
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        color: Colors.black,
        backgroundColor: Colors.transparent,
        items: [
          Icon(
            Icons.group,
            color: Colors.green,
          ),
          Icon(
            Icons.group_add,
            color: Colors.green.shade800,
          ),
          Icon(Icons.credit_card, color: Colors.green),
          Icon(Icons.person, color: Colors.green),
        ],
      ),
    );
  }
}
