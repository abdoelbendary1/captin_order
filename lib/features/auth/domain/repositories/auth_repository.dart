import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String staffIdOrEmail,
    required String pinOrPassword,
    required bool rememberStation,
  });

  Future<Either<Failure, UserEntity>> register({
    required String fullName,
    required String role,
    required String email,
    required String pin,
  });

  Future<bool> checkAutoLoginAvailable();

  Future<void> logout();
}
