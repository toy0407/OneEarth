abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class SubmittingFormStatus extends FormSubmissionStatus {}

class SubmissionSuccessStatus extends FormSubmissionStatus {}

class SubmissionFailedStatus extends FormSubmissionStatus {
  final Exception exception;

  SubmissionFailedStatus(this.exception);
}
