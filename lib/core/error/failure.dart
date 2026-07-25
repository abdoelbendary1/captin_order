import 'package:freezed_annotation/freezed_annotation.dart';
import '../constants/app_strings.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError([String? message]) = _ServerError;
  const factory Failure.networkError([String? message]) = _NetworkError;
  const factory Failure.unknownError([String? message]) = _UnknownError;
}

extension FailureX on Failure {
  String get displayMessage => when(
        serverError: (msg) => msg ?? AppStrings.errorMessage,
        networkError: (msg) => msg ?? 'Network connection error. Please try again.',
        unknownError: (msg) => msg ?? AppStrings.errorMessage,
      );
}