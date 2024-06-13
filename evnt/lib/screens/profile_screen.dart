import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color.fromARGB(255, 255, 106, 0),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 85, // Adjusted size
                backgroundColor: Color.fromARGB(255, 255, 106, 0),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                user?.email ?? 'No email',
                style: TextStyle(fontSize: 24, color: Colors.grey[700]),
              ),
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My interests:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    Chip(
                      label: const Text('sports'),
                      onDeleted: () {},
                      backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: const Text('pets'),
                      onDeleted: () {},
                      backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: const Text('indoor'),
                      onDeleted: () {},
                      backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: const Text('outdoor'),
                      onDeleted: () {},
                      backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: const Text('movies'),
                      onDeleted: () {},
                      backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Current Location:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Montevideo, Uruguay',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 18, color: Colors.black), // Increased size
                    children: [
                      TextSpan(text: 'Events attended: '),
                      TextSpan(
                        text: '10 events',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16), // Increased space
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 18, color: Colors.black), // Increased size
                    children: [
                      TextSpan(text: 'Events created: '),
                      TextSpan(
                        text: '2 events',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 106, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
              color: Colors.white,
              iconSize: 40, // Tamaño del ícono
            ),
          ],
        ),
      ),
    );
  }
}
