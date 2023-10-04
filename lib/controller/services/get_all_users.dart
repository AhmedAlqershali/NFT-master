
import 'dart:convert';



import 'package:http/http.dart' as http;

import '../controller_model/users_model.dart';
class AllUsersService
{
  bool status = false;
  String message = "";
  List<Map<String, dynamic>> results = [];

  Future<List<UsersModel>> getAllUsers() async {
    final url = Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Users/Users");

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
          List<UsersModel> UsersList = [];

        for(int i=0; i<results.length; i++){
          UsersList.add(
            UsersModel.fromJson(results[i]),
              );
            }
        return UsersList;
      } else {
        throw Exception('Failed to load data');
      }

  }



}