import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  Locale? intialLang;
  void  changeLang(String codeLang) async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    intialLang = sharedPref.getString("lang") == "ar" ?  Locale("ar") : Locale("en");
    Locale locale = Locale(codeLang);
    sharedPref.setString("lang",codeLang);
    Get.updateLocale(locale);
    }
}