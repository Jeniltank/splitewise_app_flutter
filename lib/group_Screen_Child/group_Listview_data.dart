// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/group_Screen_Child/Add_friends.dart';
//
// class GroupListView extends StatelessWidget {
//   final String groupName;
//   final String groupType;
//
//   const GroupListView({
//     Key? key,
//     required this.groupName,
//     required this.groupType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Define an IconData variable to hold the icon data
//     IconData iconData;
//
//     // Determine the icon based on the group type
//     if (groupType.toLowerCase() == 'food') {
//       iconData = Icons.food_bank; // Example icon for food
//     } else {
//       iconData = Icons.airplanemode_active; // Example icon for trip
//     }
//
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Row(
//           children: [
//             // Icon widget to display the icon
//             SizedBox(
//               width: 50,
//             ),
//             Icon(
//               iconData,
//               size: 30,
//             ),
//             SizedBox(width: 10), // Add some spacing
//             // Text widget to display the group name
//             Text(
//               groupName,
//               style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Row to display the "Group Type" label and its value in the same line
//             Row(
//               children: [
//                 Text(
//                   'Group Type: ',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 Text(
//                   groupType,
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddFriends(),
//                       ));
//                   // Add onPressed functionality for the button
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 12.0, horizontal: 24.0),
//                   child: Text(
//                     'Add Frined',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/group_Screen_Child/Add_friends.dart';

class GroupListView extends StatelessWidget {
  final String groupName;
  final String groupType;

  const GroupListView({
    Key? key,
    required this.groupName,
    required this.groupType,
    required friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    // Determine the icon based on the group type
    if (groupType.toLowerCase() == 'food') {
      iconData = Icons.food_bank; // Example icon for food
    } else {
      iconData = Icons.airplanemode_active; // Example icon for trip
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              groupName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Group Type: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  groupType,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFriends(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  primary: Colors.green,
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Add Friend',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
