import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:evnt/services/firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, dynamic>> userData;
  bool notificationsEnabled = false;
  int eventsCreated = 0;
  int eventsAttended = 0;
  String frequency = "Each time an event appears";
  final List<String> frequencyOptions = [
    "Everyday",
    "Each time an event appears",
    "Every week",
    "Every 10 days"
  ];

  @override
  void initState() {
    super.initState();
    final User? user = FirebaseAuth.instance.currentUser;
    userData = FirestoreService().getUserData(user?.email ?? '');
    userData.then((data) {
      setState(() {
        notificationsEnabled = data['notifications'] ?? false;
        eventsCreated = data['created'] ?? 0;
        eventsAttended = data['attended'] ?? 0;
        frequency = data['frequency'] ?? "Each time an event appears";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 85,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user?.email ?? 'No email',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My interests:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              FutureBuilder<Map<String, dynamic>>(
                future: userData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text('Error loading data');
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Text('No data available');
                  }

                  List<dynamic> interests = snapshot.data!['interests'] ?? [];

                  return Wrap(
                    spacing: 10,
                    children: interests
                        .map((interest) => Chip(label: Text(interest)))
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Current Location:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Montevideo, Uruguay',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Events attended:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$eventsAttended events',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Events created:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$eventsCreated events',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Enable notifications'),
                value: notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    notificationsEnabled = value;
                    // FirestoreService().updateUserNotifications(user?.email ?? '', value);
                  });
                },
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Frequency:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              DropdownButton<String>(
                value: frequency,
                onChanged: (String? newValue) {
                  setState(() {
                    frequency = newValue!;
                    // FirestoreService().updateUserFrequency(user?.email ?? '', newValue);
                  });
                },
                items: frequencyOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Privacy policy & terms of service',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Log Out'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
