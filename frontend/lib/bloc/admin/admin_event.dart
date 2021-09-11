abstract class AdminEvent {}

class locationChange extends AdminEvent {
  final String? location;
  locationChange({this.location});
}

class timeChange extends AdminEvent {
  final String? time;
  timeChange({this.time});
}

class submitPlaceButton extends AdminEvent {}
