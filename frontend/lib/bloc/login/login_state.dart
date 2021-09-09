import 'package:covid_vaccination/bloc/form_submission.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 5;
  final String password;
  bool get isValidpassword => password.length > 4;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
