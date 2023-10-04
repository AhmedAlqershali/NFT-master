import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../prefs/shared_pref_controller.dart';
import '../controller_model/users_model.dart';

class AllUsersService extends GetxController{
  bool status = false;
  String message = "";
  List<Map<String, dynamic>> results = [];
  UsersModel? usersModel;



  Future<List<UsersModel>> getAllUsers() async {
    final url =
    Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Users/Users");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data["result"];
      final dataResult = result["data"];
      final resultArray = dataResult["result"];
      status = result["status"];
      message = result["message"];
      results = List<Map<String, dynamic>>.from(resultArray);
      usersModel=data;
      print(status);
      print(message);
      print(results);
      List<UsersModel> UsersList = [];

      for (int i = 0; i < results.length; i++) {
        UsersList.add(
          UsersModel.fromJson(results[i]),
        );
      }
      return UsersList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UsersModel>> SearchUserByName(String firstName) async {
    final url =
    Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Users/SearchUser?FirstName=$firstName");

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

      for (int i = 0; i < results.length; i++) {
        UsersList.add(
          UsersModel.fromJson(results[i]),
        );
      }
      return UsersList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> updateUserDetails(String fullName, String bio, int points, String email, String instagram, String twitter) async {
    final url = Uri.parse(
        "http://storesuadia-001-site1.etempurl.com/api/Users/UpdateUserDetails");

    String token =
    SharedPrefController().getValue<String>(PrefKeys.token.name)!;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5OTkwMTEiLCJlbWFpbCI6Ijk3MjU5NzY2ODQ0NiIsImp0aSI6IjA2OGM2YjQ3LWQ5MDgtNDgwYy1iYzRhLWIzYjJkNDQ2ZjFiNCIsInVzZXJJZCI6IjZlYWRjNzNhLTBkNjAtNDQ2Yi1iODE0LTM3ODQ1ODQ2NGZiOSIsImV4cCI6MTY5NjIxNzM0MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzA0MS8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MDQxLyJ9.QXBXLPjKZst7dY9RMQaTlfvz3DUCJvLtjwQrwrKvkJo'

    final response = await http.put(url, headers: headers, body: {
      json.encode({
        "fullName": fullName,
        "bio": bio,
        "points": "$points",
        "email": email,
        "instagram": instagram,
        "twitter": twitter,
      }),
    });
    if (response.statusCode == 200) {
      print('نجحت عملية التعديل');
    } else {
      throw Exception('Failed to load data + ${response.reasonPhrase}');
    }
  }

  Future<void> changePassword(String confirmNewPassword, String newPassword, String currentPassword) async {
    final url = Uri.parse(
        "http://storesuadia-001-site1.etempurl.com/api/Users/ChangePassword");

    String token =
    SharedPrefController().getValue<String>(PrefKeys.token.name)!;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5OTkwMTEiLCJlbWFpbCI6Ijk3MjU5NzY2ODQ0NiIsImp0aSI6IjA2OGM2YjQ3LWQ5MDgtNDgwYy1iYzRhLWIzYjJkNDQ2ZjFiNCIsInVzZXJJZCI6IjZlYWRjNzNhLTBkNjAtNDQ2Yi1iODE0LTM3ODQ1ODQ2NGZiOSIsImV4cCI6MTY5NjIxNzM0MSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzA0MS8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MDQxLyJ9.QXBXLPjKZst7dY9RMQaTlfvz3DUCJvLtjwQrwrKvkJo'

    final response = await http.put(url, headers: headers, body: {
      json.encode({
        "confirmNewPassword": confirmNewPassword,
        "currentPassword": currentPassword,
        "newPassword": newPassword
      }),
    });
    if (response.statusCode == 200) {
      print('نجحت عملية التعديل');
    } else {
      throw Exception('Failed to load data + ${response.reasonPhrase}');
    }
  }

  Future<UsersModel> GetUserById(String id) async {
    final url =
    Uri.parse("http://storesuadia-001-site1.etempurl.com/api/Users/GetUserById?Id=$id");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      update();
      return UsersModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

}