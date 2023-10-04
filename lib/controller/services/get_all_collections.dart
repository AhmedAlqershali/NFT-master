
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../controller_model/collections.dart';
import '../controller_model/details_collections_model.dart';
class AllCollectionsService
{
  bool status = false;
  String message = "";
  List<Map<String, dynamic>> results = [];

  Future<List<Collections>> getAllCollections() async {
    final url = Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Collections/GetAll");

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
          List<Collections> CollectionsList = [];

        for(int i=0; i<results.length; i++){
              CollectionsList.add(
                Collections.fromJson(results[i]),
              );
            }
        return CollectionsList;
      } else {
        throw Exception('Failed to load data');
      }

  }



  Future<CollectionsDetailsModel> getDetailsCollection({required int id}) async {
    final response = await http.get(Uri.parse(
        'http://storesuadia-001-site1.etempurl.com/api/Collections/Details?id=$id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return CollectionsDetailsModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }





}