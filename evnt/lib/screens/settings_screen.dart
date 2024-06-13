import "package:flutter/material.dart";

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 255, 106, 0),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 106, 0),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('OK'),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'user1',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Password',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '*********',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'E-mail',
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'user1@gmail.com',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Notification Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enable notifications'),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color.fromARGB(255, 255, 106, 0),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Event\'s type:'),
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
              const Text('Frequency:'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: [
                  const DropdownMenuItem(
                    child: Text('Each time an event appears'),
                    value: 'each_time',
                  ),
                  const DropdownMenuItem(
                    child: Text('Daily'),
                    value: 'daily',
                  ),
                  const DropdownMenuItem(
                    child: Text('Weekly'),
                    value: 'weekly',
                  ),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Privacy policy & terms of service',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromARGB(255, 255, 106, 0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 255, 106, 0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Log Out'),
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
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}
