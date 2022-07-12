import 'package:bloc/bloc.dart';

import 'auth_repository.dart';
import 'form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository? authRepo;

  LoginBloc({this.authRepo}) : super(LoginState()) {
    on((event, emit) async {
      if (event is LoginEmailChanged) {
        emit(LoginState(email: event.email));
      } else if (event is LoginPasswordChanged) {
        emit(LoginState(password: event.password));
      } else if (event is LoginSubmitted) {
        emit(LoginState(formStatus: SubmittingFormStatus()));
        try {
          await authRepo?.login();
          emit(LoginState(formStatus: SubmissionSuccessStatus()));
        } on Exception catch (e) {
          emit(LoginState(formStatus: SubmissionFailedStatus(e)));
        }
      }
    });
  }
}
