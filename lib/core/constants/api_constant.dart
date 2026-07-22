import 'package:captin_order/features/active_tables/domain/entities/table_entity.dart';
import 'package:captin_order/features/open_table/domain/entities/open_table_request.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract class OpenTableRepository {
  Future<Either<Failure, TableEntity>> openTable(OpenTableRequest request);
}

abstract class ApiConstant {
  static const String baseUrl = 'https://api.example.com/v1';
  static const Duration timeout = Duration(seconds: 30);
}
