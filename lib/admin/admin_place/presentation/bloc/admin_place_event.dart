abstract class AdminPlaceEvent {
  const AdminPlaceEvent();
}

class LoadAdminFloorPlanEvent extends AdminPlaceEvent {
  const LoadAdminFloorPlanEvent();
}

class SelectAdminZoneEvent extends AdminPlaceEvent {
  final String zoneId;
  const SelectAdminZoneEvent(this.zoneId);
}

class GenerateBulkTablesEvent extends AdminPlaceEvent {
  final int count;
  const GenerateBulkTablesEvent(this.count);
}

class AddZoneEvent extends AdminPlaceEvent {
  final String zoneName;
  const AddZoneEvent(this.zoneName);
}
