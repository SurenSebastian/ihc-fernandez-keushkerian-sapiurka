import 'package:evnt/screens/menu_screen.dart';
import 'package:evnt/services/firestore.dart';
import 'package:evnt/widgets/event_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyEventsScreen extends StatelessWidget {

  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return FutureBuilder(
      future: FirestoreService().getEventsByOwner(user?.email ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var events = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Events'),
              backgroundColor: Colors.orange,
              automaticallyImplyLeading: false,
            ),
            body: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(event: events[index]);
              },
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.orange,
              child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const MenuScreen()),
                          (route) => false,
                        );
                      },
                    ),
            ),
          );
        } else {
          return const Center(child: Text('No events found'));
          // TODO: Add a button to create an event
        }
      },
    );    
  }
}