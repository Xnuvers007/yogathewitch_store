import 'package:flutter/material.dart';
import 'screens/gallery_screen.dart';
import 'screens/contact_admin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yogathewitch Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GalleryScreen(),
      routes: {
        '/contact': (context) => ContactAdminScreen(),
      },
    );
  }
}
