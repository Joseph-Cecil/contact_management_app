import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  final List<Map<String, String>> contacts;

  const ContactListPage({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Contacts'),
      ),
      body: contacts.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        contact['firstName']![0].toUpperCase(),
                      ),
                    ),
                    title: Text(
                      '${contact['firstName']} ${contact['surname']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${contact['phoneNumber']} - ${contact['city']}, ${contact['country']}',
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'No Contacts Found',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
