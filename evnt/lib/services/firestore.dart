import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt/services/models.dart';
import 'package:flutter/material.dart';

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

  Future<void> createEvent(Event event) async {
    var ref = _db.collection('events');
    await ref.add(event.toJson());
  }
}

class EventParams {
  final List<String>? tags;
  final RangeValues? ageRange;
  final bool? isFree;
  final RangeValues? priceRange;
  final DateTime? startingDateTime;
  final DateTime? finishingDateTime;

  EventParams({
    this.tags,
    this.ageRange,
    this.isFree,
    this.priceRange,
    this.startingDateTime,
    this.finishingDateTime,
  });

  @override
  String toString() {
    return 'EventParams(tags: $tags, ageRange: $ageRange, isFree: $isFree, priceRange: $priceRange, startingDateTime: $startingDateTime, finishingDateTime: $finishingDateTime)';
  }
}