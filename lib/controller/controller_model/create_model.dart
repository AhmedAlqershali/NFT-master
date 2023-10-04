import 'package:flutter/foundation.dart';

class CreateProductModel {
  String? collectionId;
  String? description;
  String? name;

  String? priceType;
  String? SubImageFile;
  String? ProductFile;
  int? price;
  String? token;
  int? Quantity;

  CreateProductModel({
    this.collectionId,
    this.description,
    this.name,
    this.priceType,
    this.SubImageFile,
    this.ProductFile,
    this.price,
    this.token,
    this.Quantity,
  });

  factory CreateProductModel.fromJson(json) {
    return CreateProductModel(
      collectionId: json['collectionId'],
      description: json['description'],
      name: json['name'],
      priceType: json['priceType'],
      SubImageFile: json['SubImageFile'],
      ProductFile: json['ProductFile'],
      price: json['price'],
      Quantity: json['Quantity'],
      token: json['token'],
    );
  }

Map<String,dynamic> toJson(){
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['collectionId'] = this.collectionId;
  data['description'] = this.description;
  data['name'] = this.name;
  data['priceType'] = this.priceType;
  data['SubImageFile'] = this.SubImageFile;
  data['ProductFile'] = this.ProductFile;
  data['price'] = this.price;
  data['Quantity'] = this.Quantity;
  return data;
}
}
