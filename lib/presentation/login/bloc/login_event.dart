import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

@immutable
class LoginEventLogOut implements LoginEvent {
  const LoginEventLogOut();
}

@immutable
class LoginEventInitialize implements LoginEvent {
  const LoginEventInitialize();
}

@immutable
class LoginEventLogIn implements LoginEvent {
  final String email;
  final String password;

  const LoginEventLogIn({
    required this.email,
    required this.password,
  });
}

@immutable
class LoginEventRegister implements LoginEvent {
  final String email;
  final String password;

  const LoginEventRegister({
    required this.email,
    required this.password,
  });
}

@immutable
class LoginEventGoToRegistration implements LoginEvent {
  const LoginEventGoToRegistration();
}

@immutable
class LoginEventGoToLogin implements LoginEvent {
  const LoginEventGoToLogin();
}
