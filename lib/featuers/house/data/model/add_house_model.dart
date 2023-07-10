// To parse this JSON data, do
//
//     final addHouseModel = addHouseModelFromJson(jsonString);

import 'dart:convert';

AddHouseModel addHouseModelFromJson(String str) =>
    AddHouseModel.fromJson(json.decode(str));

String addHouseModelToJson(AddHouseModel data) => json.encode(data.toJson());

class AddHouseModel {
  dynamic status;
  AddHouseData? data;
  String? message;

  AddHouseModel({
    this.status,
    this.data,
    this.message,
  });

  AddHouseModel copyWith({
    dynamic status,
    AddHouseData? data,
    String? message,
  }) =>
      AddHouseModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddHouseModel.fromJson(Map<String, dynamic> json) => AddHouseModel(
        status: json["status"],
        data: json["data"] == null ? null : AddHouseData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class AddHouseData {
  String? id;
  String? name;
  List<dynamic>? marketer;
  String? image;
  String? description;
  dynamic price;
  bool? avaliableForSale;
  String? createdDate;

  AddHouseData({
    this.id,
    this.name,
    this.marketer,
    this.image,
    this.description,
    this.price,
    this.avaliableForSale,
    this.createdDate,
  });

  AddHouseData copyWith({
    String? id,
    String? name,
    List<dynamic>? marketer,
    String? image,
    String? description,
    dynamic price,
    bool? avaliableForSale,
    String? createdDate,
  }) =>
      AddHouseData(
        id: id ?? this.id,
        name: name ?? this.name,
        marketer: marketer ?? this.marketer,
        image: image ?? this.image,
        description: description ?? this.description,
        price: price ?? this.price,
        avaliableForSale: avaliableForSale ?? this.avaliableForSale,
        createdDate: createdDate ?? this.createdDate,
      );

  factory AddHouseData.fromJson(Map<String, dynamic> json) => AddHouseData(
        id: json["id"],
        name: json["name"],
        marketer: json["marketer"] == null
            ? []
            : List<dynamic>.from(json["marketer"]!.map((x) => x)),
        image: json["image"],
        description: json["description"],
        price: json["price"],
        avaliableForSale: json["avaliableForSale"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "marketer":
            marketer == null ? [] : List<dynamic>.from(marketer!.map((x) => x)),
        "image": image,
        "description": description,
        "price": price,
        "avaliableForSale": avaliableForSale,
        "createdDate": createdDate,
      };
}
