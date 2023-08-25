// To parse this JSON data, do
//
//     final isimpleProduct = isimpleProductFromJson(jsonString);

import 'dart:convert';

IsimpleProductResponse isimpleProductFromJson(String str) =>
    IsimpleProductResponse.fromJson(json.decode(str));

String isimpleProductToJson(IsimpleProductResponse data) => json.encode(data.toJson());

class IsimpleProductResponse {
  bool success;
  String msg;
  Data data;

  IsimpleProductResponse({
    required this.success,
    required this.msg,
    required this.data,
  });

  factory IsimpleProductResponse.fromJson(Map<String, dynamic> json) => IsimpleProductResponse(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  int fee;
  String kodeproduk;
  List<IProduct> data;

  Data({
    required this.fee,
    required this.kodeproduk,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fee: json["fee"],
        kodeproduk: json["kodeproduk"],
        data: List<IProduct>.from(json["data"].map((x) => IProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fee": fee,
        "kodeproduk": kodeproduk,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}


class IProduct {
  String name;
  String amount;
  String dnmcode;
  String type;
  String subtype;
  String detailBenefit;
  String disclaimer;

  IProduct({
    required this.name,
    required this.amount,
    required this.dnmcode,
    required this.type,
    required this.subtype,
    required this.detailBenefit,
    required this.disclaimer,
  });

  factory IProduct.fromJson(Map<String, dynamic> json) => IProduct(
        name: json["name"],
        amount: json["amount"],
        dnmcode: json["dnmcode"],
        type: json["type"],
        subtype: json["subtype"],
        detailBenefit: json["detail_benefit"],
        disclaimer: json["disclaimer"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "dnmcode": dnmcode,
        "type": type,
        "subtype": subtype,
        "detail_benefit": detailBenefit,
        "disclaimer": disclaimer,
      };
}
