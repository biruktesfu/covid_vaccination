import 'package:covid_vaccination/bloc/admin/admin_event.dart';
import 'package:covid_vaccination/bloc/admin/admin_state.dart';
import 'package:covid_vaccination/bloc/form_submission.dart';
import 'package:covid_vaccination/repository/aut_repo_admin.dart';
import 'package:covid_vaccination/bloc/admin/admin_event.dart';
import 'package:covid_vaccination/bloc/admin/admin_state.dart';
import 'package:covid_vaccination/repository/aut_repo_admin.dart';
import 'package:covid_vaccination/repository/auth_repo_signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final authRepoAdmin? authrepo;

  AdminBloc(this.authrepo) : super(AdminState());

  @override
  Stream<AdminState> mapEventToState(AdminEvent event) async* {
    if (event is locationChange) {
      yield state.copyWith(location: event.location);
      //
    } else if (event is timeChange) {
      yield state.copyWith(time: event.time);
      //
    } else if (event is submitPlaceButton) {
      yield state.copyWith(formstatus: FormSubmitting());
    }
  }
}
