import 'package:captin_order/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository) : super(const AuthState()) {
    on<LoginSubmittedEvent>(_onLoginSubmitted);
    on<RegisterSubmittedEvent>(_onRegisterSubmitted);
    on<CheckAutoLoginStatusEvent>(_onCheckAutoLoginStatus);
    on<LogoutRequestedEvent>(_onLogoutRequested);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _repository.login(
      staffIdOrEmail: event.staffIdOrEmail,
      pinOrPassword: event.pinOrPassword,
      rememberStation: event.rememberStation,
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.displayMessage)),
      (user) => emit(state.copyWith(
        isLoading: false,
        user: user,
        successMessage: 'Welcome back, ${user.fullName}!',
      )),
    );
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmittedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _repository.register(
      fullName: event.fullName,
      role: event.role,
      email: event.email,
      pin: event.pin,
    );

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.displayMessage)),
      (user) => emit(state.copyWith(
        isLoading: false,
        user: user,
        successMessage: 'Staff profile registered successfully!',
      )),
    );
  }

  Future<void> _onCheckAutoLoginStatus(
    CheckAutoLoginStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    final available = await _repository.checkAutoLoginAvailable();
    emit(state.copyWith(isAutoLoginAvailable: available));
  }

  Future<void> _onLogoutRequested(
    LogoutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _repository.logout();
    emit(const AuthState());
  }
}
