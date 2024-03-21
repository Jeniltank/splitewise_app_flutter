// import 'package:flutter/material.dart';
// import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
// import 'package:splitewise_flutter/models/group.dart';
//
// class AddGroup extends StatefulWidget {
//   const AddGroup({Key? key}) : super(key: key);
//
//   @override
//   State<AddGroup> createState() => _AddGroupState();
// }
//
// class _AddGroupState extends State<AddGroup> {
//   final DatabaseServiceForAddGroup _databaseService =
//       DatabaseServiceForAddGroup();
//   TextEditingController groupNameController = TextEditingController();
//   String? groupType;
//   List<String> groupList = []; // List to store group names
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text(
//           "Create a group",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green,
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: Icon(Icons.close, color: Colors.white),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundColor:
//                       Colors.green, // Customize the color as needed
//                   child: Icon(
//                     Icons.group,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                     width:
//                         10), // Add some space between the CircleAvatar and TextField
//                 Expanded(
//                   child: TextField(
//                     controller: groupNameController,
//                     style: TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: 'Enter group name',
//                       hintStyle: TextStyle(color: Colors.white),
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Type",
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(height: 20),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         groupType = 'Trip';
//                       });
//                     },
//                     child: Text(
//                       'Trip',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: groupType == 'Trip' ? Colors.green : Colors.grey,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         groupType = 'Food';
//                       });
//                     },
//                     child: Text(
//                       'Food',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       primary: groupType == 'Food' ? Colors.green : Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 String groupName = groupNameController.text;
//                 if (groupName.isNotEmpty && groupType != null) {
//                   String userId =
//                       await _databaseService.getUserIdFromUsersCollection(
//                           groupName); // Fetch the user ID from the Users collection in Firestore
//                   // String userId = await _databaseService.getUserIdFromUsersCollection();
//                   Group group = Group(
//                     groupName: groupName,
//                     groupType: groupType!,
//                     //groupId: '', // Replace with actual groupId from Firestore
//                     creatorUserId: userId,
//                     groupId: '', groupMembers: [], // Use the fetched user ID
//                   );
//
//                   await _databaseService.addGroup(group, userId);
//
//                   setState(() {
//                     groupList.add(groupName);
//                   });
//                   groupNameController.clear();
//                 } else {
//                   print('Please enter group name and select group type');
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.green,
//                 textStyle: TextStyle(color: Colors.white),
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: Text(
//                 'Create Group',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 30),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: groupList.length,
//                 itemBuilder: (context, index) {
//                   String groupName = groupList[index];
//                   return ListTile(
//                     title: Text(
//                       groupName,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: AddGroup(),
//   ));
// }
import 'package:flutter/material.dart';
import 'package:splitewise_flutter/Firebase_services/database_service_for_add_group.dart';
import 'package:splitewise_flutter/models/group.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({Key? key}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  final DatabaseServiceForAddGroup _databaseService =
      DatabaseServiceForAddGroup();
  TextEditingController groupNameController = TextEditingController();
  String? groupType;
  List<String> groupList = []; // List to store group names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Create a group",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal, // Customize the color as needed
                  child: Icon(
                    Icons.group,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                    width:
                        10), // Add some space between the CircleAvatar and TextField
                Expanded(
                  child: TextField(
                    controller: groupNameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Enter group name',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Type",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        groupType = 'Trip';
                      });
                    },
                    child: Text(
                      'Trip',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: groupType == 'Trip' ? Colors.teal : Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        groupType = 'Food';
                      });
                    },
                    child: Text(
                      'Food',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: groupType == 'Food' ? Colors.teal : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String groupName = groupNameController.text;
                if (groupName.isNotEmpty && groupType != null) {
                  String userId =
                      await _databaseService.getUserIdFromUsersCollection(
                          groupName); // Fetch the user ID from the Users collection in Firestore
                  Group group = Group(
                    groupName: groupName,
                    groupType: groupType!,
                    creatorUserId: userId,
                    groupId: '',
                    groupMembers: [],
                  );

                  await _databaseService.addGroup(group, userId);

                  setState(() {
                    groupList.add(groupName); // Add new group to the list
                  });
                  groupNameController.clear();
                } else {
                  print('Please enter group name and select group type');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                textStyle: TextStyle(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Create Group',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: groupList.length,
                itemBuilder: (context, index) {
                  String groupName = groupList[index];
                  return ListTile(
                    title: Text(
                      groupName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddGroup(),
  ));
}
