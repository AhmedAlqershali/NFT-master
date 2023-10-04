
import 'dart:convert';

import '../controller_model/create_products_model.dart';
import 'package:http/http.dart' as http;
class AllProductsService
{
  bool status = false;
  String message = "";
  List<Map<String, dynamic>> results = [];

  Future<List<CreateProductsModel>> getAllProducts() async {
    final url = Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Products/GetAllProducts");
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
      List<CreateProductsModel> ProductsList = [];

      for(int i=0; i<results.length; i++){
        ProductsList.add(
          CreateProductsModel.fromJson(results[i]),
        );
      }
      return ProductsList;
    } else {
      throw Exception('Failed to load data');
    }

  }



}