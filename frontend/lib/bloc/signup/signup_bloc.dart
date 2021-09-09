import 'package:covid_vaccination/bloc/signup/signup_event.dart';
import 'package:covid_vaccination/bloc/signup/signup_state.dart';
import 'package:covid_vaccination/repository/auth_repo_signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepositorysignup? authreposignup;

  SignupBloc({this.authreposignup}) : super(SignupState());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is fullnameChange) {
      yield state.copyWith(fullname: event.fullname);
      //
    } else if (event is usernameChange) {
      yield state.copyWith(username: event.username);
      //
    } else if (event is phonenumberChange) {
      yield state.copyWith(phonenumber: event.phonenumber);
      //
    } else if (event is passwordChange) {
      yield state.copyWith(password: event.password);
      //
    } else if (event is retypepasswordChange) {
      yield state.copyWith(retypePassword: event.retypepassword);
      //
    }
  }
}
