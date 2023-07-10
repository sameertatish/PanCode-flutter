// To parse this JSON data, do
//
//     final houseModel = houseModelFromJson(jsonString);

import 'dart:convert';

HouseModel houseModelFromJson(String str) =>
    HouseModel.fromJson(json.decode(str));

String houseModelToJson(HouseModel data) => json.encode(data.toJson());

class HouseModel {
  dynamic status;
  dynamic numberPurchasedHouse;
  List<HouseData>? data;

  HouseModel({
    this.status,
    this.numberPurchasedHouse,
    this.data,
  });

  HouseModel copyWith({
    dynamic status,
    dynamic numberPurchasedHouse,
    List<HouseData>? data,
  }) =>
      HouseModel(
        status: status ?? this.status,
        numberPurchasedHouse: numberPurchasedHouse ?? this.numberPurchasedHouse,
        data: data ?? this.data,
      );

  factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
        status: json["status"],
        numberPurchasedHouse: json["numberPurchasedHouse"],
        data: json["data"] == null
            ? []
            : List<HouseData>.from(
                json["data"]!.map((x) => HouseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "numberPurchasedHouse": numberPurchasedHouse,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class HouseData {
  String? id;
  String? name;
  List<Marketer>? marketer;
  String? image;
  String? description;
  dynamic price;
  bool? avaliableForSale;
  String? createdDate;

  HouseData({
    this.id,
    this.name,
    this.marketer,
    this.image,
    this.description,
    this.price,
    this.avaliableForSale,
    this.createdDate,
  });

  HouseData copyWith({
    String? id,
    String? name,
    List<Marketer>? marketer,
    String? image,
    String? description,
    dynamic price,
    bool? avaliableForSale,
    String? createdDate,
  }) =>
      HouseData(
        id: id ?? this.id,
        name: name ?? this.name,
        marketer: marketer ?? this.marketer,
        image: image ?? this.image,
        description: description ?? this.description,
        price: price ?? this.price,
        avaliableForSale: avaliableForSale ?? this.avaliableForSale,
        createdDate: createdDate ?? this.createdDate,
      );

  factory HouseData.fromJson(Map<String, dynamic> json) => HouseData(
        id: json["id"],
        name: json["name"],
        marketer: json["marketer"] == null
            ? []
            : List<Marketer>.from(
                json["marketer"]!.map((x) => Marketer.fromJson(x))),
        image: json["image"],
        description: json["description"],
        price: json["price"],
        avaliableForSale: json["avaliableForSale"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "marketer": marketer == null
            ? []
            : List<dynamic>.from(marketer!.map((x) => x.toJson())),
        "image": image,
        "description": description,
        "price": price,
        "avaliableForSale": avaliableForSale,
        "createdDate": createdDate
      };
}

class Marketer {
  String? id;
  String? name;
  String? referenceCode;
  String? gender;
  double? percentage;
  dynamic minBalance;
  String? houseId;
  dynamic minAmount;
  String? createdDate;

  Marketer({
    this.id,
    this.name,
    this.referenceCode,
    this.gender,
    this.percentage,
    this.minBalance,
    this.houseId,
    this.minAmount,
    this.createdDate,
  });

  Marketer copyWith({
    String? id,
    String? name,
    String? referenceCode,
    String? gender,
    double? percentage,
    dynamic minBalance,
    String? houseId,
    dynamic minAmount,
    String? createdDate,
  }) =>
      Marketer(
        id: id ?? this.id,
        name: name ?? this.name,
        referenceCode: referenceCode ?? this.referenceCode,
        gender: gender ?? this.gender,
        percentage: percentage ?? this.percentage,
        minBalance: minBalance ?? this.minBalance,
        houseId: houseId ?? this.houseId,
        minAmount: minAmount ?? this.minAmount,
        createdDate: createdDate ?? this.createdDate,
      );

  factory Marketer.fromJson(Map<String, dynamic> json) => Marketer(
        id: json["id"],
        name: json["name"],
        referenceCode: json["reference_code"],
        gender: json["gender"],
        percentage: json["percentage"]?.toDouble(),
        minBalance: json["min_balance"],
        houseId: json["houseId"],
        minAmount: json["min_amount"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "reference_code": referenceCode,
        "gender": gender,
        "percentage": percentage,
        "min_balance": minBalance,
        "houseId": houseId,
        "min_amount": minAmount,
        "createdDate": createdDate,
      };
}
