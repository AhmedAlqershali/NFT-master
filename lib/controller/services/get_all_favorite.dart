import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../prefs/shared_pref_controller.dart';

class AllFavoriteProductsService {
  bool status = false;
  String message = "";
  List<Map<String, dynamic>> results = [];
  String token = SharedPrefController().getuser().token!;

  Future<void> AddFavoriteProducts(String id) async{


    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final url = Uri.parse("https://storesuadia-001-site1.etempurl.com/api/Favorites/AddFavoriteProduct");
    final data = {'productId': '33'};
    final response = await http.post(
      url,
      body: json.encode(data),
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    print(response);
    if(response.statusCode == 200){
      print("تمت العملبة بنجاح");
    }else{
      print(response.reasonPhrase);
    }

  }

  Future<void> getFavoriteProducts() async {
    var headers = {
      'Authorization': 'Bearer ${token}'
    };
    var request = http.Request('GET', Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Favorites/GetFavoriteProducts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
    }
    else {
      print(response.reasonPhrase);
    }

    }

}