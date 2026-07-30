import 'admin_zone_entity.dart';

class AdminFloorPlanEntity {
  final List<AdminZoneEntity> zones;
  final String activeZoneId;
  final List<int> tableNumbers;

  const AdminFloorPlanEntity({
    required this.zones,
    required this.activeZoneId,
    required this.tableNumbers,
  });

  int get totalTablesCount => tableNumbers.length;
}
