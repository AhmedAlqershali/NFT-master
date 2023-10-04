
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nft/controller/controller_model/users_model.dart';

import 'package:nft/screens/bn_screen.dart';

import '../../prefs/shared_pref_controller.dart';

class GetLoginController extends GetxController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController verificationCodeController;
  late UsersModel userData;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    verificationCodeController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneNumberController.dispose();
    verificationCodeController.dispose();
    super.dispose();
  }


  Future<void> loginUser() async {
    final url = Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Auth/Login');
    final Map<String, dynamic> requestData = {
      "phoneNumber": phoneNumberController.text,
      "password": passwordController.text,
      "verificationCode": verificationCodeController.text
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {

      final jsonResponse = jsonDecode(response.body);
       userData = UsersModel.fromJson(jsonResponse);
       print(userData);


      // يمكنك استخدام userData للوصول إلى البيانات
      print("تم تسجيل الدخول بنجاح");
      print("UserId: ${userData.token}");

      await SharedPrefController().save(userData);
      // الانتقال إلى الشاشة المستهدفة هنا
      Get.offAll(() => BnScreen());
    } else {
      print("حدث خطأ أثناء تسجيل الدخول");
      print(response.body);
    }
  }

}
