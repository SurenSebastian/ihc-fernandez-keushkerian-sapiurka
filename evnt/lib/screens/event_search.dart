import 'package:evnt/widgets/event_detailed_card.dart';
import 'package:flutter/material.dart';

class EventSearchScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {'title': 'Rock Concert', 'location': 'Central Park', 'time': '13:00'},
    {'title': 'Yoga Class', 'location': 'Fitness local', 'time': '19:00'},
    {'title': 'Comedy Show', 'location': "Pedro's restaurant", 'time': ''},
    {'title': 'Pop Concert', 'location': 'Central Park', 'time': '18:00'},
    {'title': 'Football Match', 'location': 'Central Park', 'time': '19:00'},
    {'title': 'Wood Craft Class', 'location': "Sarah's Coffee Shop", 'time': '19:30'},
    {'title': 'Pets Meeting', 'location': 'Central Park', 'time': '15:00'},
    {'title': 'Cumbia Festival', 'location': 'Central Park', 'time': '20:00'},
    {'title': 'Skydiving', 'location': 'Skydiving Center', 'time': '10:00'},
    {'title': 'Basketball Game', 'location': 'Central Park', 'time': '17:00'},
    {'title': 'Art Exhibition', 'location': 'Central Park', 'time': '16:00'},
    {'title': 'Movie Night', 'location': 'Central Park', 'time': '20:00'},
    {'title': 'Cooking Workshop', 'location': 'Central Park', 'time': '18:00'},
    {'title': 'Book Club Meeting', 'location': 'Central Park', 'time': '19:00'},
  ];

  EventSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find your next adventure'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventDetailedCard(event: events[index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Acción al presionar el botón de retroceso
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Acción al presionar el botón de búsqueda
              },
            ),
          ],
        ),
      ),
    );
  }
}