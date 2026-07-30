abstract class AuthEvent {
  const AuthEvent();
}

class LoginSubmittedEvent extends AuthEvent {
  final String staffIdOrEmail;
  final String pinOrPassword;
  final bool rememberStation;

  const LoginSubmittedEvent({
    required this.staffIdOrEmail,
    required this.pinOrPassword,
    required this.rememberStation,
  });
}

class RegisterSubmittedEvent extends AuthEvent {
  final String fullName;
  final String role;
  final String email;
  final String pin;

  const RegisterSubmittedEvent({
    required this.fullName,
    required this.role,
    required this.email,
    required this.pin,
  });
}

class CheckAutoLoginStatusEvent extends AuthEvent {
  const CheckAutoLoginStatusEvent();
}

class LogoutRequestedEvent extends AuthEvent {
  const LogoutRequestedEvent();
}
