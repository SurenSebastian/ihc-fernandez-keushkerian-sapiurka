// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      location: json['location'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      owner: json['owner'] as String? ?? '',
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'descripcion': instance.description,
      'dateTime': instance.dateTime.toIso8601String(),
      'location': instance.location,
      'price': instance.price,
      'tags': instance.tags,
      'owner': instance.owner,
    };
