import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String staffIdOrEmail,
    required String pinOrPassword,
    required bool rememberStation,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        staffIdOrEmail: staffIdOrEmail,
        pinOrPassword: pinOrPassword,
      );
      await _localDataSource.saveUser(user, rememberStation);
      return right(user);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String fullName,
    required String role,
    required String email,
    required String pin,
  }) async {
    try {
      final user = await _remoteDataSource.register(
        fullName: fullName,
        role: role,
        email: email,
        pin: pin,
      );
      await _localDataSource.saveUser(user, true);
      return right(user);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<bool> checkAutoLoginAvailable() async {
    final user = await _localDataSource.getUser();
    final isRemembered = await _localDataSource.isRemembered();
    return user != null && isRemembered;
  }

  @override
  Future<void> logout() async {
    await _localDataSource.clearUser();
  }
}
