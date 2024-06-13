import 'package:evnt/screens/my_events_screen.dart';
import 'package:evnt/screens/profile_screen.dart';
import 'package:evnt/screens/settings_screen.dart';
import 'package:evnt/widgets/menu_botton.dart';
import 'package:flutter/material.dart';
import 'package:evnt/screens/event_search.dart';

//import 'package:evnt/screens/create_event_screen.dart';
class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: const Color.fromARGB(255, 255, 106, 0),
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 35)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            MenuButton(
                icon: Icons.add_box,
                label: 'Create Event',
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const (),
                  //   ),
                  // );
                }),
            MenuButton(
              icon: Icons.search,
              label: 'Search Event',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventSearchScreen(),
                  ),
                );
              },
            ),
            MenuButton(
                icon: Icons.event,
                label: 'My Events',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyEventsScreen(),
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 106, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              color: Colors.white,
              iconSize: 40,
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              color: Colors.white,
              iconSize: 40,
            ),
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
