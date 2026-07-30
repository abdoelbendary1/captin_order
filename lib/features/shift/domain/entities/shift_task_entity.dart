enum ShiftTaskPriority { high, normal, low }

class ShiftTaskEntity {
  final String id;
  final String title;
  final String subtitle;
  final bool isCompleted;
  final ShiftTaskPriority priority;

  const ShiftTaskEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
    this.priority = ShiftTaskPriority.normal,
  });

  ShiftTaskEntity copyWith({
    String? id,
    String? title,
    String? subtitle,
    bool? isCompleted,
    ShiftTaskPriority? priority,
  }) {
    return ShiftTaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
    );
  }
}
