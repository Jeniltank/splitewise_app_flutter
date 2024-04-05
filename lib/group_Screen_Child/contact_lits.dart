import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  late Future<List<Contact>> _contactsFuture;
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contactsFuture = getContacts();
  }

  Future<List<Contact>> getContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      return FastContacts.getAllContacts();
    } else {
      return [];
    }
  }

  void _searchContacts(String query) {
    setState(() {
      _filteredContacts = _contacts
          .where((contact) =>
              contact.displayName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _searchContacts,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Contact>>(
              future: _contactsFuture,
              builder: (context, snapshot) {
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
                  _contacts = snapshot.data!;
                  return ListView.builder(
                    itemCount: _filteredContacts.isEmpty
                        ? _contacts.length
                        : _filteredContacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = _filteredContacts.isEmpty
                          ? _contacts[index]
                          : _filteredContacts[index];
                      return ListTile(
                        title: Text(
                          contact.displayName!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (contact.phones.isNotEmpty)
                              Text(
                                  "Phone: ${contact.phones.first.number ?? ''}"),
                          ],
                        ),
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        onTap: () {
                          // Handle contact tap
                        },
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person_add_alt_sharp),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
