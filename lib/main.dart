import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nft/constants/app.theme.dart';
import 'package:nft/prefs/shared_pref_controller.dart';
import 'package:nft/screens/auth/sign_in.dart';
import 'package:nft/screens/auth/sign_up.dart';
import 'package:nft/screens/bn_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lang/locale.dart';
import 'lang/locale_controller.dart';


// bool darkMode = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          MyLocaleController c= Get.put(MyLocaleController());
          return GetMaterialApp(
            theme: ThemesService().lightTheme,
            darkTheme: ThemesService().darkTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: c.intialLang,
            translations: MyLocale(),
            // home: const SignIn(),
            home: const SignIn(),

          );
          });
    }
}