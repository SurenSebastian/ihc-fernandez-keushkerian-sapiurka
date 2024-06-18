import 'package:evnt/screens/event_advanced_search.dart';
import 'package:evnt/services/firestore.dart';
import 'package:evnt/widgets/event_detailed_card.dart';
import 'package:flutter/material.dart';

class EventSearchScreen extends StatelessWidget {
  final EventParams _eventParams;

  const EventSearchScreen(this._eventParams, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService().getFilteredEvents(_eventParams),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData){
          var events = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Find your next adventure'),
              backgroundColor: Colors.orange,
            ),
            body: events.isEmpty 
                ? const Center(child: Text('No events found')) 
                : ListView.builder(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EventAdvancedSearchScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('Error: No events found.'));
        }
      },
    );

  }
}