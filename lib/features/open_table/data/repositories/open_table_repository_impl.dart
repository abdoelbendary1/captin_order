import 'package:captin_order/core/constants/api_constant.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../../domain/entities/open_table_request.dart';
import '../datasources/open_table_remote_datasource.dart';

@LazySingleton(as: OpenTableRepository)
class OpenTableRepositoryImpl implements OpenTableRepository {
  final OpenTableRemoteDataSource _dataSource;

  OpenTableRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, TableEntity>> openTable(
    OpenTableRequest request,
  ) async {
    try {
      if (request.tableNumber.trim().isEmpty) {
        return left(
          const Failure.unknownError('Table number cannot be empty.'),
        );
      }
      if (request.guestCount <= 0) {
        return left(
          const Failure.unknownError('Guest count must be at least 1.'),
        );
      }

      final table = await _dataSource.openTable(request);
      return right(table);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
