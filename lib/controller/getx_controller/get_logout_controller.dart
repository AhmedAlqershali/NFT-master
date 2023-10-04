// //
// // import 'dart:convert';
// //
// // import 'package:http/http.dart' as http;
// // import 'package:get/get.dart';
// // import 'package:nft/controller/api_response.dart';
// // import 'package:nft/prefs/shared_pref_controller.dart';
// //
// // class GetLogoutController extends GetxController{
// //   String token =
// //   SharedPrefController().getValue<String>(PrefKeys.token.name)!;
// //
// //
// //   Future<ApiResponse> logout() async {
// //
// //     Uri uri = Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Auth/RevokeToken/revokeToken');
// //     var response = await http.get(uri,       headers: <String, String>{
// //       'Content-Type': 'application/json; charset=UTF-8',
// //       'Authorization': 'Bearer $token',
// //
// //     },);
// //     if (response.statusCode == 200 || response.statusCode == 401) {
// //       await SharedPrefController().clear();
// //       if (response.statusCode == 200) {
// //         var jsonResponse = jsonDecode(response.body);
// //          return ApiResponse(status: jsonResponse['status'], message: jsonResponse['message']);
// //       }
// //       return ApiResponse(status: true, message: 'Logged out successfully');
// //     }
// //     return ApiResponse(status: false, message: 'Something went wrong');
// //   }
// //
// //
// // }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:nft/controller/api_response.dart';
// import 'package:nft/prefs/shared_pref_controller.dart';
//
// class GetLogoutController extends GetxController {
//
//   Future<ApiResponse> logout() async {
//     Uri uri = Uri.parse(ApiSettings.logout);
//     var response = await http.get(uri, headers: headers);
//     if (response.statusCode == 200 || response.statusCode == 401) {
//       await SharedPrefController().clear();
//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         // return ApiResponse(status: jsonResponse['status'], message: jsonResponse['message']);
//       }
//       return ApiResponse(status: true, message: 'Logged out successfully');
//     }
//     return ApiResponse(status: false, message: 'Something went wrong');
//   }
// }
