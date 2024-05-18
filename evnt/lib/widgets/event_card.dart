import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Map<String, String> event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.orange),
      ),
      child: ListTile(
        leading: Icon(
          Icons.image,
          color: Colors.orange,
        ),
        title: Text(event['title']!),
      ),
    );
  }
}