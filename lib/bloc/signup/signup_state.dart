import 'package:covid_vaccination/bloc/form_submission.dart';

class SignupState {
  final String fullname;
  bool get isvalidfullname => fullname.length > 4;

  final String username;
  bool get isValidusername => username.length > 4;

  final String phonenumber;
  bool get isValidphonenumber =>
      phonenumber.length == 10 &&
      phonenumber[0] == "0" &&
      phonenumber[1] == "9";

  final String password;
  bool get isValidPassword => password.length > 4;
  final String retypePassword;
  bool get confirmPassword {
    print(">>>>> $retypePassword");
    print(">>>>>>>> $password");
    return retypePassword == password;
  }

  final FormSubmissionStatus formStatus;

  SignupState({
    this.fullname = '',
    this.username = '',
    this.phonenumber = '',
    this.password = '',
    this.retypePassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? fullname,
    String? username,
    String? phonenumber,
    String? password,
    String? retypePassword,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      phonenumber: phonenumber ?? this.phonenumber,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
