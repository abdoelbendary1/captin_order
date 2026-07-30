import 'package:flutter/material.dart';

class AdminShiftFilterEntity {
  final DateTimeRange dateRange;
  final String staffMemberId;

  const AdminShiftFilterEntity({
    required this.dateRange,
    this.staffMemberId = 'all',
  });

  AdminShiftFilterEntity copyWith({
    DateTimeRange? dateRange,
    String? staffMemberId,
  }) {
    return AdminShiftFilterEntity(
      dateRange: dateRange ?? this.dateRange,
      staffMemberId: staffMemberId ?? this.staffMemberId,
    );
  }
}
