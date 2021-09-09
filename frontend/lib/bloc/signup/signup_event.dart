abstract class SignupEvent {}

class fullnameChange extends SignupEvent {
  final String? fullname;
  fullnameChange({this.fullname});
}

class usernameChange extends SignupEvent {
  final String? username;
  usernameChange({this.username});
}

class passwordChange extends SignupEvent {
  final String? password;
  passwordChange({this.password});
}

class retypepasswordChange extends SignupEvent {
  final String? retypepassword;
  retypepasswordChange({this.retypepassword});
}

class phonenumberChange extends SignupEvent {
  final String? phonenumber;
  phonenumberChange({this.phonenumber});
}

class SignupButtonClick extends SignupEvent {}
