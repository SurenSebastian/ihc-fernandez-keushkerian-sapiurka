import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Event {
  final String title;
  final String description;
  final DateTime dateTime;
  final String location;
  final double price;
  final List<String> tags;
  final String owner;

  Event({
      this.title = '',
      this.description = '',
      required this.dateTime,
      this.location = '',
      this.price = 0,
      this.tags = const [],
      this.owner = '',
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}