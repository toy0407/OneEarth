import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:one_earth/auth/auth_error.dart';

@immutable
abstract class AppState {
  final bool isLoading;
  final AuthError? authError;

  const AppState({required this.isLoading, required this.authError});
}

@immutable
class AppStateLoggedIn extends AppState {
  final User user;

  const AppStateLoggedIn({
    required bool isLoading,
    required AuthError? authError,
    required this.user,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

@immutable
class AppStateLoggedOut extends AppState {
  const AppStateLoggedOut({
    required bool isLoading,
    required AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

@immutable
class AppStateIsInRegistrationView extends AppState {
  const AppStateIsInRegistrationView({
    required bool isLoading,
    required AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );
}

extension GetUser on AppState {
  User? get user {
    final cls = this;
    if (cls is AppStateLoggedIn) {
      return cls.user;
    } else {
      return null;
    }
  }
}
