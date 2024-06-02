import 'package:evnt/screens/event_screen.dart';
import 'package:evnt/screens/event_search.dart';
import 'package:evnt/screens/my_events_screen.dart';
import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // Error screen
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'E-vnt',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            home: const EventSearchScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(child: CircularProgressIndicator());
      }
    );    
  }
}
