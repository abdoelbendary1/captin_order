import 'shift_activity_entity.dart';
import 'shift_task_entity.dart';

class ShiftSummaryEntity {
  final String shiftId;
  final DateTime startTime;
  final double salesAmount;
  final double salesTrendPercent;
  final double dailyTargetPercent;
  final double digitalTips;
  final double cashTips;
  final String avgPrepTime;
  final double customerSatisfaction;
  final bool isPaused;
  final List<ShiftTaskEntity> tasks;
  final List<ShiftActivityEntity> activities;

  const ShiftSummaryEntity({
    required this.shiftId,
    required this.startTime,
    required this.salesAmount,
    required this.salesTrendPercent,
    required this.dailyTargetPercent,
    required this.digitalTips,
    required this.cashTips,
    required this.avgPrepTime,
    required this.customerSatisfaction,
    this.isPaused = false,
    required this.tasks,
    required this.activities,
  });

  double get totalTips => digitalTips + cashTips;
  int get remainingTasksCount => tasks.where((t) => !t.isCompleted).length;
}
