import 'package:flutter/foundation.dart';

class UsersModel {
  String? userId;
  String? phoneNumber;
  String? fullName;
  int? credit;
  int? points;
  String? cityId;
  String? bio;
  String? email;
  String? verificationCode;
  String? createdAt;
  bool? isDelete;
  String? twitter;
  String? instagram;
  int? sales;
  String? token;
  int? products;
  int? cartID;
  int? notifications;
  int? favoratites;
  int? followings;
  int? followers;

  UsersModel({
    this.userId,
    this.phoneNumber,
    this.fullName,
    this.credit,
    this.points,
    this.cityId,
    this.bio,
    this.email,
    this.verificationCode,
    this.createdAt,
    this.isDelete,
    this.twitter,
    this.instagram,
    this.sales,
    this.token,
    this.products,
    this.cartID,
    this.notifications,
    this.favoratites,
    this.followings,
    this.followers,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    phoneNumber = json['phoneNumber'];
    verificationCode = json['verificationCode'];
    fullName = json['fullName'];
    bio = json['bio'];
    points = json['points'];
    credit = json['credit'];
    email = json['email'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    products = json['products'];
    sales = json['sales'];
    cartID = json['cartID'];
    followers = json['followers'];
    followings = json['followings'];
    favoratites = json['favoratites'];
    notifications = json['notifications'];
    token = json['token'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['phoneNumber'] = this.phoneNumber;
    data['verificationCode'] = this.verificationCode;
    data['fullName'] = this.fullName;
    data['bio'] = this.bio;
    data['points'] = this.points;
    data['credit'] = this.credit;
    data['email'] = this.email;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['products'] = this.products;
    data['sales'] = this.sales;
    data['cartID'] = this.cartID;
    data['followers'] = this.followers;
    data['followings'] = this.followings;
    data['favoratites'] = this.favoratites;
    data['notifications'] = this.notifications;
    data['token'] = this.token;

    return data;
  }
}
