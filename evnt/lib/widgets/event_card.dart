import 'package:evnt/services/models.dart';
import 'package:evnt/screens/event_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventScreen(event: event),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: Colors.orange),
        ),
        child: ListTile(
          leading: const Icon(
            Icons.event,
            color: Colors.orange,
          ),
          title: Text(event.title),
        ),
      ),
    );
  }
}