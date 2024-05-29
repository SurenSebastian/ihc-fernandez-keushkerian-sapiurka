import 'package:evnt/screens/menu_screen.dart';
import 'package:evnt/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'screens/start_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-vnt',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SettingsScreen(),
    );
  }
}
