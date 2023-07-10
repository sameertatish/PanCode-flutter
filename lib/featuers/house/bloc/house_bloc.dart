import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/house/bloc/house_event.dart';
import 'package:test_flutter/featuers/house/bloc/house_state.dart';
import 'package:test_flutter/featuers/house/data/add_house_api.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final DioHouse api;
  HouseBloc({required this.api}) : super(HouseInitialState()) {
    on<AddHouse>(_addHouse);
    on<GetAllHouse>(_getAllHouse);
  }

  void _addHouse(
    AddHouse event,
    Emitter<HouseState> emit,
  ) async {
    try {
      bool isLogin = (await getToken()).isNotEmpty;
      if (isLogin) {
        emit(HouseLoadingState());
        var res = await api.addHouse(event.addHouseBodyModel, event.imageFile);
        emit(AddHouseLoadedState(houseModel: res));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (err) {
      emit(HouseFailureState(message: err.toString()));
    }
  }

  void _getAllHouse(
    GetAllHouse event,
    Emitter<HouseState> emit,
  ) async {
    try {
      bool isLogin = (await getToken()).isNotEmpty;
      if (isLogin) {
        emit(HouseLoadingState());
        var res = await api.getAllHouse();
        emit(HouseLoadedState(houseModel: res));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (err) {
      emit(HouseFailureState(message: err.toString()));
    }
  }
}
