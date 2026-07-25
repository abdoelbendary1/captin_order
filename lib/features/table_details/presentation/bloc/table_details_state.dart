import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

part 'table_details_state.freezed.dart';

@freezed
class TableDetailsState with _$TableDetailsState {
  const factory TableDetailsState.loading() = TableDetailsLoadingState;
  const factory TableDetailsState.error({required String message}) = TableDetailsErrorState;
  const factory TableDetailsState.success({
    required TableEntity table,
    @Default(false) bool isActionInProgress,
    String? message,
  }) = TableDetailsSuccessState;
}
