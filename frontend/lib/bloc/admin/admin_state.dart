import 'package:covid_vaccination/bloc/form_submission.dart';

class AdminState {
  final String location;
  bool get isValidLocation => location.length > 6;

  final String time;
  bool get isValidTime => int.parse(time) > DateTime.daysPerWeek;

  final FormSubmissionStatus formstatus;

  AdminState({
    this.location = '',
    this.time = '',
    this.formstatus = const InitialFormStatus(),
  });

  AdminState copyWith({
    String? location,
    String? time,
    FormSubmissionStatus? formstatus,
  }) {
    return AdminState(
      location: location ?? this.location,
      time: time ?? this.time,
      formstatus: formstatus ?? this.formstatus,
    );
  }
}
