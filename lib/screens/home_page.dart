import 'package:contact_management/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import '../widgets/contact_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> contacts = [];

  void addContact(Map<String, String> contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.contacts),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactListPage(contacts: contacts),
                ),
              );  
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ContactForm(onSave: addContact)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactListPage(contacts: contacts),
            ),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
