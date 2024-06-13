import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, String> event;

  const EventCard({super.key, required this.event});

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
        title: Text(event['title']!),
      ),
    );
  }
}