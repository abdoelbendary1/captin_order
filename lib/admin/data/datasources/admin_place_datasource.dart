import 'package:captin_order/admin/domain/entities/admin_floor_plan_entity.dart';
import 'package:captin_order/admin/domain/entities/admin_zone_entity.dart';
import 'package:injectable/injectable.dart';

abstract class AdminPlaceDataSource {
  Future<AdminFloorPlanEntity> getFloorPlan();
  Future<AdminFloorPlanEntity> generateBulkTables(int count);
  Future<AdminFloorPlanEntity> addZone(String zoneName);
}

@LazySingleton(as: AdminPlaceDataSource)
class AdminPlaceDataSourceImpl implements AdminPlaceDataSource {
  List<AdminZoneEntity> _zones = [
    const AdminZoneEntity(id: 'z1', name: 'Indoor', isSelected: true),
    const AdminZoneEntity(id: 'z2', name: 'Outdoor', isSelected: false),
    const AdminZoneEntity(id: 'z3', name: 'Roof', isSelected: false),
  ];

  List<int> _tableNumbers = List.generate(12, (index) => index + 1);

  @override
  Future<AdminFloorPlanEntity> getFloorPlan() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final activeId = _zones.firstWhere((z) => z.isSelected, orElse: () => _zones.first).id;
    return AdminFloorPlanEntity(
      zones: List.from(_zones),
      activeZoneId: activeId,
      tableNumbers: List.from(_tableNumbers),
    );
  }

  @override
  Future<AdminFloorPlanEntity> generateBulkTables(int count) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newCount = count > 0 ? count : 12;
    _tableNumbers = List.generate(newCount, (index) => index + 1);
    return getFloorPlan();
  }

  @override
  Future<AdminFloorPlanEntity> addZone(String zoneName) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newZone = AdminZoneEntity(
      id: 'z_${DateTime.now().millisecondsSinceEpoch}',
      name: zoneName,
      isSelected: false,
    );
    _zones.add(newZone);
    return getFloorPlan();
  }
}
