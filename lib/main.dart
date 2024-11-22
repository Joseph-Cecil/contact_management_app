import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(const ContactManagementApp());
}

class ContactManagementApp extends StatelessWidget {
  const ContactManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Management App',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
