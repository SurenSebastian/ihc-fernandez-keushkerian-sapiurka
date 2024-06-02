import 'package:evnt/services/models.dart';
import 'package:flutter/material.dart';

class EventDetailedCard extends StatelessWidget {
  final Event event;
  const EventDetailedCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(color: Colors.orange),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.image,
          color: Colors.orange,
        ),
        title: Text(event.title),
        subtitle: Text('${event.location} ${event.time}'),
      ),
    );
  }
}