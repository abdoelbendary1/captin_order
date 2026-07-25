// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineEvent _$TimelineEventFromJson(Map<String, dynamic> json) =>
    _TimelineEvent(
      id: json['id'] as String,
      title: json['title'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      actor: json['actor'] as String,
    );

Map<String, dynamic> _$TimelineEventToJson(_TimelineEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'timestamp': instance.timestamp.toIso8601String(),
      'actor': instance.actor,
    };
