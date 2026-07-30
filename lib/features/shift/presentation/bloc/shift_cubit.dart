import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/shift_activity_entity.dart';
import '../../domain/entities/shift_summary_entity.dart';
import '../../domain/entities/shift_task_entity.dart';

class ShiftState {
  final bool isLoading;
  final ShiftSummaryEntity? shift;
  final String? errorMessage;

  const ShiftState({
    this.isLoading = false,
    this.shift,
    this.errorMessage,
  });

  ShiftState copyWith({
    bool? isLoading,
    ShiftSummaryEntity? shift,
    String? errorMessage,
  }) {
    return ShiftState(
      isLoading: isLoading ?? this.isLoading,
      shift: shift ?? this.shift,
      errorMessage: errorMessage,
    );
  }
}

class ShiftCubit extends Cubit<ShiftState> {
  ShiftCubit() : super(const ShiftState()) {
    loadShiftData();
  }

  void loadShiftData() {
    emit(state.copyWith(isLoading: true));

    final now = DateTime.now();
    final startTime = now.subtract(const Duration(hours: 5, minutes: 42, seconds: 20));

    final mockTasks = [
      const ShiftTaskEntity(
        id: '1',
        title: 'Deep clean steam wands',
        subtitle: 'Due by 1:00 PM • High Priority',
        isCompleted: false,
        priority: ShiftTaskPriority.high,
      ),
      const ShiftTaskEntity(
        id: '2',
        title: 'Restock oat and almond milk',
        subtitle: 'Inventory low in main fridge',
        isCompleted: false,
        priority: ShiftTaskPriority.normal,
      ),
      const ShiftTaskEntity(
        id: '3',
        title: 'Check grinder calibration',
        subtitle: 'Completed at 08:15 AM',
        isCompleted: true,
        priority: ShiftTaskPriority.normal,
      ),
    ];

    final mockActivities = [
      const ShiftActivityEntity(
        id: 'a1',
        time: '12:42 PM',
        eventType: 'Refund Issued',
        description: 'Refunded Order #8421 (\$14.50) - Cold brew spilled on arrival.',
      ),
      const ShiftActivityEntity(
        id: 'a2',
        time: '11:15 AM',
        eventType: 'Inventory Update',
        description: 'Marked "Blueberry Muffin" as Out of Stock.',
      ),
      const ShiftActivityEntity(
        id: 'a3',
        time: '10:30 AM',
        eventType: 'Order Volume',
        description: 'High peak detected. 25 orders in the last 15 minutes.',
      ),
    ];

    final shift = ShiftSummaryEntity(
      shiftId: '8821',
      startTime: startTime,
      salesAmount: 1842.50,
      salesTrendPercent: 12.0,
      dailyTargetPercent: 0.75,
      digitalTips: 142.20,
      cashTips: 45.00,
      avgPrepTime: '2:45 min',
      customerSatisfaction: 4.9,
      isPaused: false,
      tasks: mockTasks,
      activities: mockActivities,
    );

    emit(state.copyWith(isLoading: false, shift: shift));
  }

  void toggleTask(String taskId) {
    final currentShift = state.shift;
    if (currentShift == null) return;

    final updatedTasks = currentShift.tasks.map((task) {
      if (task.id == taskId) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();

    final updatedShift = ShiftSummaryEntity(
      shiftId: currentShift.shiftId,
      startTime: currentShift.startTime,
      salesAmount: currentShift.salesAmount,
      salesTrendPercent: currentShift.salesTrendPercent,
      dailyTargetPercent: currentShift.dailyTargetPercent,
      digitalTips: currentShift.digitalTips,
      cashTips: currentShift.cashTips,
      avgPrepTime: currentShift.avgPrepTime,
      customerSatisfaction: currentShift.customerSatisfaction,
      isPaused: currentShift.isPaused,
      tasks: updatedTasks,
      activities: currentShift.activities,
    );

    emit(state.copyWith(shift: updatedShift));
  }

  void togglePauseShift() {
    final currentShift = state.shift;
    if (currentShift == null) return;

    final updatedShift = ShiftSummaryEntity(
      shiftId: currentShift.shiftId,
      startTime: currentShift.startTime,
      salesAmount: currentShift.salesAmount,
      salesTrendPercent: currentShift.salesTrendPercent,
      dailyTargetPercent: currentShift.dailyTargetPercent,
      digitalTips: currentShift.digitalTips,
      cashTips: currentShift.cashTips,
      avgPrepTime: currentShift.avgPrepTime,
      customerSatisfaction: currentShift.customerSatisfaction,
      isPaused: !currentShift.isPaused,
      tasks: currentShift.tasks,
      activities: currentShift.activities,
    );

    emit(state.copyWith(shift: updatedShift));
  }
}
