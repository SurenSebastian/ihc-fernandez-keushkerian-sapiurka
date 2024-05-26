import 'package:evnt/widgets/event_card.dart';
import 'package:flutter/material.dart';

class MyEventsScreen extends StatelessWidget {
  // List of events as Mock data
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

  @override
  Widget build(BuildContext context) {
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
  }
}