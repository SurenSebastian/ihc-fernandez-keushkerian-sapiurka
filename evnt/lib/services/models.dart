import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Event {
  final String title;
  final String location;
  final String time;

  Event({
      this.title = '',
      this.location = '',
      this.time = '',
    });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}