import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Color.fromARGB(255, 255,106, 0),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 85, // Adjusted size
                backgroundColor: Color.fromARGB(255, 255,106, 0),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'user1',
                style: TextStyle(fontSize: 24, color: Colors.grey[700]),
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My interests:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
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
                      backgroundColor: Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    Chip(
                      label: Text('movies'),
                      onDeleted: () {},
                      backgroundColor: Color.fromARGB(255, 255,106, 0),
                      deleteIconColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Current Location:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Montevideo, Uruguay',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black), // Increased size
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
              SizedBox(height: 16), // Increased space
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black), // Increased size
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