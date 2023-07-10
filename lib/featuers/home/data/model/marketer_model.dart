// To parse this JSON data, do
//
//     final marketerModel = marketerModelFromJson(jsonString);

import 'dart:convert';

MarketerModel marketerModelFromJson(String str) =>
    MarketerModel.fromJson(json.decode(str));

String marketerModelToJson(MarketerModel data) => json.encode(data.toJson());

class MarketerModel {
  dynamic status;
  List<MarketerData>? data;
  dynamic numberPurchasedHouse;
  dynamic totalItem;

  MarketerModel({
    this.status,
    this.data,
    this.numberPurchasedHouse,
    this.totalItem,
  });

  MarketerModel copyWith({
    dynamic status,
    List<MarketerData>? data,
    dynamic numberPurchasedHouse,
    dynamic totalItem,
  }) =>
      MarketerModel(
        status: status ?? this.status,
        data: data ?? this.data,
        numberPurchasedHouse: numberPurchasedHouse ?? this.numberPurchasedHouse,
        totalItem: totalItem ?? this.totalItem,
      );

  factory MarketerModel.fromJson(Map<String, dynamic> json) => MarketerModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<MarketerData>.from(
                json["data"]!.map((x) => MarketerData.fromJson(x))),
        numberPurchasedHouse: json["numberPurchasedHouse"],
        totalItem: json["total_item"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "numberPurchasedHouse": numberPurchasedHouse,
        "total_item": totalItem,
      };
}

class MarketerData {
  String? id;
  String? name;
  String? referenceCode;
  String? gender;
  double? percentage;
  dynamic minBalance;
  String? houseId;
  dynamic minAmount;
  String? createdDate;

  MarketerData({
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

  MarketerData copyWith({
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
      MarketerData(
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

  factory MarketerData.fromJson(Map<String, dynamic> json) => MarketerData(
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
