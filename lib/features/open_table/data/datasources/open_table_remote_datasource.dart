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

    return TableEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tableNumber: request.tableNumber,
      status: TableStatus.occupied,
      guestCount: request.guestCount,
      currentTotal: 0.0,
      seatedAt: DateTime.now(),
      areaName: request.areaName,
      assignedCaptain: request.assignedCaptain ?? 'Shop Captain',
      items: const [],
    );
  }
}
