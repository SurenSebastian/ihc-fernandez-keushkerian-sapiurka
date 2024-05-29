import "package:flutter/material.dart";


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor:Color.fromARGB(255, 255,106, 0),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
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
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255,106, 0),
                      foregroundColor: Colors.white,
                    ),
                    child: Text('OK'),
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
              SizedBox(height: 16),
              Text(
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
              SizedBox(height: 16),
              Text(
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
              SizedBox(height: 32),
              Text(
                'Notification Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Enable notifications'),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Color.fromARGB(255, 255,106, 0),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Event\'s type:'),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    Chip(
                      label: Text('sports'),
                      onDeleted: () {},
                      backgroundColor: Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: Text('pets'),
                      onDeleted: () {},
                      backgroundColor: Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: Text('indoor'),
                      onDeleted: () {},
                      backgroundColor: Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: Text('outdoor'),
                      onDeleted: () {},
                      backgroundColor:Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: Text('movies'),
                      onDeleted: () {},
                      backgroundColor:Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('Frequency:'),
              SizedBox(height: 8),
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
                  DropdownMenuItem(
                    child: Text('Each time an event appears'),
                    value: 'each_time',
                  ),
                  DropdownMenuItem(
                    child: Text('Daily'),
                    value: 'daily',
                  ),
                  DropdownMenuItem(
                    child: Text('Weekly'),
                    value: 'weekly',
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy policy & terms of service',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color.fromARGB(255, 255,106, 0),
                    side: BorderSide(color:Color.fromARGB(255, 255,106, 0)),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Log Out'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 255,106, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
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