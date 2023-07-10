import 'package:equatable/equatable.dart';

abstract class DashbaordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDashboardDetails extends DashbaordEvent {
  GetDashboardDetails();
}

class CheckInternet extends DashbaordEvent {
  CheckInternet();
}
