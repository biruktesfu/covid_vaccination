//used to track changes on the login view(password change,
// username change, button click)

abstract class LoginEvent {}

class usernameChange extends LoginEvent {
  final String? username;
  usernameChange({this.username});
}

class passwordChange extends LoginEvent {
  final String? password;

  passwordChange({this.password});
}

class loginButtonClick extends LoginEvent {}
