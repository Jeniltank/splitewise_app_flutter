// import 'package:fast_contacts/fast_contacts.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class ContactListPage extends StatefulWidget {
//   const ContactListPage({Key? key}) : super(key: key);
//
//   @override
//   _ContactListPageState createState() => _ContactListPageState();
// }
//
// class _ContactListPageState extends State<ContactListPage> {
//   Future<List<Contact>> getContacts() async {
//     bool isGranted = await Permession.contacts.status.isGranted;
//     if (isGranted) return await FastContacts.getAllContacts();
//   }
//
//   List<String> contacts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // _getContacts();
//   }
//
//   // Future<void> _getContacts() async {
//   //   // Request permission
//   //   var status = await Permission.contacts.request();
//   //
//   //   if (status.isGranted) {
//   //     // Permission granted, fetch contacts
//   //     // Your code to fetch contacts goes here
//   //   } else {
//   //     // Permission denied
//   //     // You can display a message to the user or handle the denial gracefully
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Contact List',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//       ),
//       body: Container(
//         child: FutureBuilder(
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(
//                 child: SizedBox(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             }
//             return ListView.builder(
//                 itemCount: snapshot.data.lenght,
//                 itemBuilder: (context, index) {
//                   Contact contact = snapshot.data[index];
//                   return ListTile(
//                     title: Text(contact.displayName),
//                     subtitle: Column(
//                       children: [
//                         Text(
//                           contact.phones[0],
//                           contact.emails[0],
//                         )
//                       ],
//                     ),
//                   );
//                 });
//           },
//           future: getContacts(),
//         ),
//       ),
//     );
//   }
// }
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Future<List<Contact>> getContacts() async {
    // Check if permission is granted
    var status = await Permission.contacts.status;
    if (!status.isGranted) {
      // Request permission
      await Permission.contacts.request();
      // Check if permission is granted after request
      if (await Permission.contacts.isGranted) {
        // Permission granted, fetch contacts
        return await FastContacts.getAllContacts();
      } else {
        // Permission denied
        return []; // Return an empty list if permission is denied
      }
    } else {
      // Permission already granted, fetch contacts
      return await FastContacts.getAllContacts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: FutureBuilder<List<Contact>>(
          future: getContacts(),
          builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text('No contacts available'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Contact contact = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      contact.displayName ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     if (contact.phones.isNotEmpty)
                    //       Text("Phone: ${contact.phones.first.value ?? ''}"),
                    //     if (contact.emails.isNotEmpty)
                    //       Text("Email: ${contact.emails.first.value ?? ''}"),
                    //   ],
                    // ),
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    onTap: () {
                      // Handle contact tap
                    },
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outlined),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
