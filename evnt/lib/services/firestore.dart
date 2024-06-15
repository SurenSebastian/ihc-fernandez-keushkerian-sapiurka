import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Event>> getEvents() async {
    var ref = _db.collection('events');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Event.fromJson(d));
    return topics.toList();
  }

  Future<List<Event>> getEventsByOwner(String ownerEmail) async {
    var ref = _db.collection('events').where('owner', isEqualTo: ownerEmail);
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Event.fromJson(d));
    return topics.toList();
  }
}