import 'package:flutter/material.dart';

abstract class AdminShiftHistoryEvent {
  const AdminShiftHistoryEvent();
}

class LoadShiftHistoryEvent extends AdminShiftHistoryEvent {
  const LoadShiftHistoryEvent();
}

class UpdateDateRangeEvent extends AdminShiftHistoryEvent {
  final DateTimeRange dateRange;

  const UpdateDateRangeEvent(this.dateRange);
}

class UpdateStaffFilterEvent extends AdminShiftHistoryEvent {
  final String staffMemberId;

  const UpdateStaffFilterEvent(this.staffMemberId);
}

class DownloadPdfReportEvent extends AdminShiftHistoryEvent {
  const DownloadPdfReportEvent();
}
