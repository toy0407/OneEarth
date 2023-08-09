import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar, Text;
import 'package:one_earth/presentation/login/auth/auth_error.dart';

void showAuthError({
  required AuthError authError,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    content: Text(authError.dialogDescription),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
