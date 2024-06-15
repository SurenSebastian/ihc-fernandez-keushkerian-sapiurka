import 'package:evnt/services/firestore.dart';
import 'package:evnt/widgets/event_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyEventsScreen extends StatelessWidget {
  // List of events as Mock data
  /*
  final List<Map<String, String>> events = [
    {'title': 'Rock Concert'},
    {'title': 'Pop Concert'},
    {'title': 'Pets meeting'},
    {'title': 'Yoga Class'},
    {'title': 'Crossfit Class'},
    {'title': 'Football match'},
    {'title': 'Cumbia Festival'},
    {'title': 'Skydiving'},
    {'title': 'Pets meeting'},
    {'title': 'Basketball Game'},
    {'title': 'Art Exhibition'},
    {'title': 'Movie Night'},
    {'title': 'Cooking Workshop'},
    {'title': 'Book Club Meeting'},
  ];
  */

  MyEventsScreen({super.key});

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
            ),
            body: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(event: events[index]);
              },
            ),
            bottomNavigationBar: const BottomAppBar(
              color: Colors.orange,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
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