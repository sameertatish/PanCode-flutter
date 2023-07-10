import '../data/model/marketer_model.dart';

abstract class DashbaordState {}

class DashbaordLoadedState extends DashbaordState {
  final MarketerModel houseModel;

  DashbaordLoadedState({required this.houseModel});
}

class DashbaordInitialState extends DashbaordState {}

class CheckInternetStateloaded extends DashbaordState {
  final bool isConnected;

  CheckInternetStateloaded({required this.isConnected});
}

class UnauthenticatedState extends DashbaordState {}

class DashbaordLoadingState extends DashbaordState {}

class DashbaordFailureState extends DashbaordState {
  final String message;

  DashbaordFailureState({required this.message});
}
