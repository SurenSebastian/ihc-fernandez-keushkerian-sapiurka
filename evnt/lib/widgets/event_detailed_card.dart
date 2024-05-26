import 'package:flutter/material.dart';

class EventDetailedCard extends StatelessWidget {
  final Map<String, String> event;

  EventDetailedCard({required this.event});

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
        subtitle: Text('${event['location']} ${event['time']}'),
      ),
    );
  }
}