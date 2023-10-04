
import 'dart:convert';

import '../controller_model/users_model.dart';
import 'package:http/http.dart' as http;
class AllTopSellerService
{
  bool status = false;
  String message = "";
  List<Map<String, dynamic>> results = [];

  Future<List<UsersModel>> getTop3Seller() async {
    final url = Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Users/GetTopSellingUsers?count=3");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data["result"];
      final dataResult = result["data"];
      final resultArray = dataResult["result"];

      status = result["status"];
      message = result["message"];
      results = List<Map<String, dynamic>>.from(resultArray);
      print(status);
      print(message);
      print(results);
      List<UsersModel> TopSellersList = [];

      for(int i=0; i<results.length; i++){
        TopSellersList.add(
          UsersModel.fromJson(results[i]),
        );
      }
      return TopSellersList;
    } else {
      throw Exception('Failed to load data');
    }

  }
  Future<List<UsersModel>> getAllTopSeller() async {
    final url = Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Users/GetTopSellingUsers?count=100");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data["result"];
      final dataResult = result["data"];
      final resultArray = dataResult["result"];

      status = result["status"];
      message = result["message"];
      results = List<Map<String, dynamic>>.from(resultArray);
      print(status);
      print(message);
      print(results);
      List<UsersModel> TopSellersList = [];

      for(int i=0; i<results.length; i++){
        TopSellersList.add(
          UsersModel.fromJson(results[i]),
        );
      }
      return TopSellersList;
    } else {
      throw Exception('Failed to load data');
    }

  }




}