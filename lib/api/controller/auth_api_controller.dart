import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nft/prefs/shared_pref_controller.dart';

import '../api_helper.dart';
import '../api_settings.dart';
import '../models/process_response.dart';
import '../models/user.dart';

/// API Request :
///  1) Define STRING URI in ApiSettings.dart class.
///  2) Create new Future async function with suitable name.
///  3) Convert STRING URI to URI.
///  4) Define new http request :
///     A) define new request method :
///        1) http.method. ex: import ('package:http/http.dart' as http;).
///     B) Set URI in http.method(uri).
///     C) add Headers if needed.
///     D) add Body if needed.
///  5) Execute request & await Response.
///  6) Detect response results :
///     A) Status Code, U can check if request completed successfully using it.
///       1) SUCCESS: (200, 201, 202).
///       2) FAILED: (400, 401, 403, 405, 500).
///     B) Body (STRING) - encoded :
///       1) Decode response body : Convert STRING response to JSON (Map).

class AuthApiController with ApiHelper {

  Future<ProcessResponse> login(String email, String password,String verificationCode) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      "phoneNumber": email,
      "password": password,
      "verificationCode": verificationCode,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User student = User.fromJson(jsonResponse["object"]);
        //TODO: Save Student Data To SharedPreferences ..
        await SharedPrefController().save(student);
      }
      // return ProcessResponse(jsonResponse["message"], jsonResponse["status"]);
    }
    return errorResponse;
  }

  Future<ProcessResponse> register(User user) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      "phoneNumber": user.phoneNumber,
      "password": user.password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ProcessResponse(jsonResponse["message"], jsonResponse["status"]);
    }
    return errorResponse;
  }

  Future<ProcessResponse> logout() async {
    String token =
        SharedPrefController().getValue<String>(PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().clear();
      return ProcessResponse("Logged out successfully", true);
    }
    return errorResponse;
  }
}