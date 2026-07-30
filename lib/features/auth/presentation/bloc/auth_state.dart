import '../../domain/entities/user_entity.dart';

class AuthState {
  final bool isLoading;
  final bool isAutoLoginAvailable;
  final UserEntity? user;
  final String? errorMessage;
  final String? successMessage;

  const AuthState({
    this.isLoading = false,
    this.isAutoLoginAvailable = false,
    this.user,
    this.errorMessage,
    this.successMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAutoLoginAvailable,
    UserEntity? user,
    String? errorMessage,
    String? successMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAutoLoginAvailable: isAutoLoginAvailable ?? this.isAutoLoginAvailable,
      user: user ?? this.user,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
