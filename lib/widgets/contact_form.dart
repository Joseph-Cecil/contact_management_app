import 'package:flutter/material.dart';
import '../widgets/dropdown.dart';
import '../utils/validators.dart';

class ContactForm extends StatefulWidget {
  final void Function(Map<String, String>) onSave;

  const ContactForm({Key? key, required this.onSave}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? selectedCountry;
  String? selectedCity;

  final Map<String, List<String>> countryCityMap = {
    'Ghana': ['Lababi', 'Osu', 'Lapaz'],
    'Nigeria': ['Lagos', 'Delta', 'Port Hacrt'],
  };

  void _clearFields() {
    firstNameController.clear();
    surnameController.clear();
    phoneNumberController.clear();
    selectedCountry = null;
    selectedCity = null;
  }

  void _saveContact() {
    if (!Validators.validateInputs(
        firstNameController.text, surnameController.text, phoneNumberController.text, selectedCountry, selectedCity)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }
    widget.onSave({
      'firstName': firstNameController.text,
      'surname': surnameController.text,
      'phoneNumber': phoneNumberController.text,
      'country': selectedCountry!,
      'city': selectedCity!,
    });
    _clearFields();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add a New Contact',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(
              labelText: 'Surname',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: phoneNumberController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 8),
          Dropdown(
            value: selectedCountry,
            hint: 'Select Country',
            items: countryCityMap.keys.toList(),
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
                selectedCity = null;
              });
            },
          ),
          const SizedBox(height: 8),
          Dropdown(
            value: selectedCity,
            hint: 'Select City',
            items: selectedCountry != null ? countryCityMap[selectedCountry]! : [],
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saveContact,
            child: const Text('Save Contact'),
          ),
        ],
      ),
    );
  }
}
