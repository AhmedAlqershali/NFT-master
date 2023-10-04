
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:nft/controller/api_response.dart';
import 'package:nft/prefs/shared_pref_controller.dart';

class GetDeleteController extends GetxController{
  String token =
  SharedPrefController().getValue<String>(PrefKeys.token.name)!;


  Future<void> deleteAccount() async {
    final url = Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Users/DeleteAccount');

    final response = await http.delete(
      url,
      headers: {
        'Authorization': '$token', // إرفاق التوكن في رأس الطلب
      },
    );

    if (response.statusCode == 204) {
      // تم حذف الحساب بنجاح
      print('Account deleted successfully.');
    } else if (response.statusCode == 401) {
      // التوكن غير صحيح أو منتهي الصلاحية، يجب تسجيل الدخول مرة أخرى
      print('Invalid token or token expired.');
    } else {
      // حدث خطأ آخر
      print('Failed to delete account. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


}