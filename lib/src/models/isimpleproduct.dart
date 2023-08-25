// To parse this JSON data, do
//
//     final isimpleProduct = isimpleProductFromJson(jsonString);

import 'dart:convert';

IsimpleProductResponse isimpleProductFromJson(String str) =>
    IsimpleProductResponse.fromJson(json.decode(str));

String isimpleProductToJson(IsimpleProductResponse data) => json.encode(data.toJson());

class IsimpleProductResponse {
  bool success;
  List<IProduct> data;

  IsimpleProductResponse({
    required this.success,
    required this.data,
  });

  factory IsimpleProductResponse.fromJson(Map<String, dynamic> json) => IsimpleProductResponse(
        success: json["success"],
        data: List<IProduct>.from(json["data"].map((x) => IProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
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
