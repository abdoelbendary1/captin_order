import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_event.freezed.dart';
part 'timeline_event.g.dart';

@freezed
abstract class TimelineEvent with _$TimelineEvent {
  const factory TimelineEvent({
    required String id,
    required String title,
    required DateTime timestamp,
    required String actor,
  }) = _TimelineEvent;

  factory TimelineEvent.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventFromJson(json);
}
