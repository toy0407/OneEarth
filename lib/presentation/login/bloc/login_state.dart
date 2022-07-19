import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../auth/auth_error.dart';

@immutable
abstract class LoginState {
  final bool isLoading;
  final AuthError? authError;

  const LoginState({
    required this.isLoading,
    this.authError,
  });
}

@immutable
class LoginStateLoggedIn extends LoginState {
  final User user;

  const LoginStateLoggedIn({
    required bool isLoading,
    AuthError? authError,
    required this.user,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

@immutable
class LoginStateLoggedOut extends LoginState {
  const LoginStateLoggedOut({
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

@immutable
class LoginStateIsInRegistrationView extends LoginState {
  const LoginStateIsInRegistrationView({
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

@immutable
class LoginStateIsInLoginView extends LoginState {
  const LoginStateIsInLoginView({
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

// @immutable
// class LoginStateIsInOnBoardingView extends LoginState {
//   const LoginStateIsInOnBoardingView({
//     required bool isLoading,
//   }) : super(
//           isLoading: isLoading,
//         );
// }

extension GetUser on LoginState {
  User? get user {
    final cls = this;
    if (cls is LoginStateLoggedIn) {
      return cls.user;
    } else {
      return null;
    }
  }
}
