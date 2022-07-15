import 'package:flutter/material.dart' show BuildContext;
import 'package:one_earth/presentation/dialogs/generic_dialog.dart';
import 'package:one_earth/presentation/login/auth/auth_error.dart';

Future<void> showAuthError({
  required AuthError authError,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: authError.dialogTitle,
    content: authError.dialogDescription,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}
