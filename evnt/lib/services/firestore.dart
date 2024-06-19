import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evnt/services/models.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //UserData functions
  Future<Map<String, dynamic>> getUserData(String email) async {
    List<Map<String, dynamic>> userDataList = [];
    QuerySnapshot querySnapshot =
        await _db.collection('userdata').where('email', isEqualTo: email).get();

    querySnapshot.docs.forEach((doc) {
      userDataList.add(doc.data() as Map<String, dynamic>);
    });

    return userDataList[0];
  }

  //Events functions
  Future<List<Event>> getEvents() async {
    var ref = _db.collection('events');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Event.fromJson(d));
    return topics.toList();
  }

  Future<List<Event>> getFilteredEvents(EventParams params) async {
    Query<Map<String, dynamic>> ref = _db.collection('events');
    if (params.tags != null) {
      ref = ref.where('tags', arrayContainsAny: params.tags);
    }
    if (params.isFree != null) {
      ref = ref.where('price', isEqualTo: 0);
    } else if (params.priceRange != null) {
      ref =
          ref.where('price', isGreaterThanOrEqualTo: params.priceRange!.start);
      ref = ref.where('price', isLessThanOrEqualTo: params.priceRange!.end);
    }
    if (params.startingDateTime != null) {
      ref = ref.where('dateTime',
          isGreaterThanOrEqualTo: params.startingDateTime);
    }
    if (params.finishingDateTime != null) {
      ref =
          ref.where('dateTime', isLessThanOrEqualTo: params.finishingDateTime);
    }
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Event.fromJson(d));
    print(topics.map((e) => e.title));
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
  final bool? isFree;
  final RangeValues? priceRange;
  final DateTime? startingDateTime;
  final DateTime? finishingDateTime;

  EventParams({
    this.tags,
    this.isFree,
    this.priceRange,
    this.startingDateTime,
    this.finishingDateTime,
  });

  @override
  String toString() {
    return 'EventParams(tags: $tags, isFree: $isFree, priceRange: $priceRange, startingDateTime: $startingDateTime, finishingDateTime: $finishingDateTime)';
  }
}
