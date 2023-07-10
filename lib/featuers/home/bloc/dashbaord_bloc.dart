import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/utils/shared_function.dart';
import 'package:test_flutter/featuers/home/bloc/dashbaord_event.dart';
import 'package:test_flutter/featuers/home/bloc/dashbaord_state.dart';
import 'package:test_flutter/featuers/home/data/dashboard_api.dart';

class DashbaordBloc extends Bloc<DashbaordEvent, DashbaordState> {
  final DioDashboard api;
  DashbaordBloc({required this.api}) : super(DashbaordInitialState()) {
    on<GetDashboardDetails>(_getDashboardDetails);
    on<CheckInternet>(_checkInternet);
  }

  void _getDashboardDetails(
    GetDashboardDetails event,
    Emitter<DashbaordState> emit,
  ) async {
    try {
      bool isLogin = (await getToken()).isNotEmpty;
      if (isLogin) {
        emit(DashbaordLoadingState());
        var res = await api.dashbaordDetails();
        emit(DashbaordLoadedState(houseModel: res));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (err) {
      emit(DashbaordFailureState(message: err.toString()));
    }
  }

  void _checkInternet(
    CheckInternet event,
    Emitter<DashbaordState> emit,
  ) async {
    try {
      bool isConnected = true;

      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        isConnected = false;
      }
      emit(CheckInternetStateloaded(isConnected: isConnected));
    } catch (err) {
      emit(DashbaordFailureState(message: err.toString()));
    }
  }
}
