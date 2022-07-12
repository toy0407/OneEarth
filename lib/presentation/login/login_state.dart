import 'form_submission_status.dart';

class LoginState {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});
}
