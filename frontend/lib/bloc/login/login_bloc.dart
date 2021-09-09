import 'package:covid_vaccination/bloc/form_submission.dart';
import 'package:covid_vaccination/bloc/login/login_event.dart';
import 'package:covid_vaccination/bloc/login/login_state.dart';
import 'package:covid_vaccination/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authrepo;

  //pass authenticaton repo to loginbloc
  LoginBloc({this.authrepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //
    if (event is usernameChange) {
      yield state.copyWith(username: event.username);
      //
    } else if (event is passwordChange) {
      yield state.copyWith(password: event.password);
      //
    } else if (event is loginButtonClick) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authrepo!.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(Exception()));
      }
    }
  }
}
