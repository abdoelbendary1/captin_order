import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError([String? message]) = _ServerError;
  const factory Failure.networkError([String? message]) = _NetworkError;
  const factory Failure.unknownError([String? message]) = _UnknownError;
}