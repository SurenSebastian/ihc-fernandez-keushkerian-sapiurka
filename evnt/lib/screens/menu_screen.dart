import 'package:evnt/widgets/menu_botton.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor:  Color.fromARGB(255, 255,106, 0),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 35)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            MenuButton(icon: Icons.add_box, label: 'Create Event'),
            MenuButton(icon: Icons.search, label: 'Search Event'),
            MenuButton(icon: Icons.event, label: 'My Events'),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:  Color.fromARGB(255, 255,106, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              color: Colors.white,
              iconSize: 40,
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
              color: Colors.white,
              iconSize: 40,
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
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