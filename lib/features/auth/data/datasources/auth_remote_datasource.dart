import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login({
    required String staffIdOrEmail,
    required String pinOrPassword,
  });

  Future<UserEntity> register({
    required String fullName,
    required String role,
    required String email,
    required String pin,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UserEntity> login({
    required String staffIdOrEmail,
    required String pinOrPassword,
  }) async {
    try {
      // Simulate API call with Dio or remote server
      await Future.delayed(const Duration(milliseconds: 700));

      if (pinOrPassword.isEmpty) {
        throw DioException(
          requestOptions: RequestOptions(path: '/auth/login'),
          error: 'PIN or Password is required',
        );
      }

      final inputLower = staffIdOrEmail.toLowerCase();
      final isAdmin = inputLower.contains('admin') || inputLower.contains('manager');
      final roleName = isAdmin ? 'Store Manager' : 'Shop Captain';

      return UserEntity(
        id: isAdmin ? 'admin_101' : 'captain_101',
        fullName: isAdmin
            ? 'Sarah Manager'
            : (staffIdOrEmail.contains('@') ? staffIdOrEmail.split('@').first : 'Captain Ahmed M.'),
        email: staffIdOrEmail.contains('@') ? staffIdOrEmail : 'ahmed@shopcaptain.com',
        role: roleName,
        token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw DioException(
        requestOptions: RequestOptions(path: '/auth/login'),
        error: e.toString(),
      );
    }
  }

  @override
  Future<UserEntity> register({
    required String fullName,
    required String role,
    required String email,
    required String pin,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 700));

      if (fullName.isEmpty || email.isEmpty || pin.isEmpty) {
        throw DioException(
          requestOptions: RequestOptions(path: '/auth/register'),
          error: 'Please fill all required fields.',
        );
      }

      return UserEntity(
        id: 'captain_${DateTime.now().millisecondsSinceEpoch}',
        fullName: fullName,
        email: email,
        role: role.isNotEmpty ? role : 'Shop Captain',
        token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw DioException(
        requestOptions: RequestOptions(path: '/auth/register'),
        error: e.toString(),
      );
    }
  }
}
