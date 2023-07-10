import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/featuers/house/data/model/add_house_body_model.dart';

abstract class HouseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddHouse extends HouseEvent {
  final AddHouseBodyModel addHouseBodyModel;
  final XFile? imageFile;
  AddHouse({this.imageFile, required this.addHouseBodyModel});
}

class GetAllHouse extends HouseEvent {}
