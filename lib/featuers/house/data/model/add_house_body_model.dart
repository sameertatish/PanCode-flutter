// To parse this JSON data, do
//
//     final addHouseBodyModel = addHouseBodyModelFromJson(jsonString);

import 'dart:convert';

AddHouseBodyModel addHouseBodyModelFromJson(String str) =>
    AddHouseBodyModel.fromJson(json.decode(str));

String addHouseBodyModelToJson(AddHouseBodyModel data) =>
    json.encode(data.toJson());

class AddHouseBodyModel {
  String? name;
  String? description;
  dynamic price;
  // String? image;

  AddHouseBodyModel({
    this.name,
    this.description,
    this.price,
    // this.image,
  });

  AddHouseBodyModel copyWith({
    String? name,
    String? description,
    dynamic price,
    // String? image,
  }) =>
      AddHouseBodyModel(
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        // image: image ?? this.image,
      );

  factory AddHouseBodyModel.fromJson(Map<String, dynamic> json) =>
      AddHouseBodyModel(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        // image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        // "image": image,
      };
}
