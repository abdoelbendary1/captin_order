import 'package:injectable/injectable.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/entities/open_table_request.dart';

abstract class OpenTableRemoteDataSource {
  Future<TableEntity> openTable(OpenTableRequest request);
}

@LazySingleton(as: OpenTableRemoteDataSource)
class OpenTableRemoteDataSourceImpl implements OpenTableRemoteDataSource {
  @override
  Future<TableEntity> openTable(OpenTableRequest request) async {
    // Simulate backend network latency
    await Future.delayed(const Duration(milliseconds: 600));

    final now = DateTime.now();
    final isOutside = request.areaName.toLowerCase().contains('outdoor') ||
        request.areaName.toLowerCase().contains('outside');

    return TableEntity(
      id: now.millisecondsSinceEpoch.toString(),
      tableNumber: request.tableNumber,
      tableCode: 'T-${request.tableNumber.padLeft(2, '0')}',
      status: TableStatus.occupied,
      location: isOutside ? TableLocation.outside : TableLocation.inside,
      guestCount: request.guestCount,
      currentTotal: 0.0,
      timeSeated: '00:00',
      openedAt: now,
      seatedAt: now,
      areaName: request.areaName,
      assignedCaptain: request.assignedCaptain ?? 'Shop Captain',
      items: const [],
    );
  }
}
