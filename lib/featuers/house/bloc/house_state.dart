import 'package:test_flutter/featuers/house/data/model/add_house_model.dart';

import '../../home/data/model/house_model.dart';

abstract class HouseState {}

class AddHouseLoadedState extends HouseState {
  final AddHouseModel houseModel;

  AddHouseLoadedState({required this.houseModel});
}

class HouseLoadedState extends HouseState {
  final HouseModel houseModel;

  HouseLoadedState({required this.houseModel});
}

class HouseInitialState extends HouseState {}

class UnauthenticatedState extends HouseState {}

class HouseLoadingState extends HouseState {}

class HouseFailureState extends HouseState {
  final String message;

  HouseFailureState({required this.message});
}
