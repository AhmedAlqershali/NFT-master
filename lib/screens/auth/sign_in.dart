import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nft/constants/app.colors.dart';
import 'package:nft/controller/getx_controller/get_login_controller.dart';
import 'package:nft/screens/auth/sign_up.dart';
import 'package:nft/screens/bn_screen.dart';
import 'package:nft/utils/context_extension.dart';
import 'package:nft/widget/button_widget.dart';
import 'package:nft/widget/edit_text_widget.dart';
import 'package:nft/widget/icon_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../lang/locale_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _verificationCodeTextController;

  String? _passwordError;
  String? _phoneError;
  bool _showPassword = false;
  late TapGestureRecognizer _tapGestureRecognizer;
  late TapGestureRecognizer _tapGestureRecognizer2;

  static RxBool isLightTheme = false.obs;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
  @override
  void initState() {
    super.initState();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _verificationCodeTextController = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _navigateToRegister;
    _tapGestureRecognizer2 = TapGestureRecognizer()
      ..onTap = _navigateToRegister2;
    // _tapGestureRecognizer.onTap = _navigateToRegister;
    _getThemeStatus();

  }

  void _navigateToRegister() =>
      Navigator.pushNamed(context, '/register_screen');

  void _navigateToRegister2() => Get.to(SignUp());

  @override
  void dispose() {
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    _verificationCodeTextController.dispose();
    _tapGestureRecognizer.dispose();
    _tapGestureRecognizer2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    RxBool isLightTheme = false.obs;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade100
                  : AppColors.black2,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  CupertinoIcons.moon_stars,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.white,
                ),
                onPressed: (){
                  Get.changeThemeMode(
                    isLightTheme.value ? ThemeMode.light : ThemeMode.dark,);
                  isLightTheme = true.obs;
                  _saveThemeStatus();
                },
              ),
              actions: [
                PopupMenuButton(
                  // add icon, by default "3 dot" icon
                    icon: Icon(
                      Icons.language,
                      color:  Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text("English"),
                        ),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Text("Arabic"),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        controllerLang.changeLang("en");
                      } else if (value == 1) {
                        controllerLang.changeLang("ar");
                      }
                    }),
              ],
            ),
            body: Container(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade100
                  : AppColors.black2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 19.h, left: 20.w, bottom: 20.h,right: 20.w),
                    child: Text(
                      'Log in'.tr,
                      style: GoogleFonts.roboto(
                          fontSize: 26.sp,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  GetBuilder<GetLoginController>(
                    init: GetLoginController(),
                    builder: (controller){
                      return Column(
                        children: [
                          EditTextWidget(
                            star: '*',
                            controller: controller.phoneNumberController,
                            name: 'Phone number'.tr,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: controller.passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: !_showPassword,
                              expands: false,
                              decoration: InputDecoration(
                                  errorText: _passwordError,
                                  label: SizedBox(
                                    width: 120.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Password'.tr),
                                        Text(
                                          " *",
                                          style: TextStyle(
                                            color: Theme.of(context).brightness ==
                                                Brightness.light
                                                ? AppColors.black
                                                : AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color:
                                      Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color:
                                      Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color:
                                      Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color:
                                      Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color: AppColors.red,
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: controller.verificationCodeController,
                              keyboardType: TextInputType.text,
                              expands: false,
                              decoration: InputDecoration(
                                  hintText: 'ABC',
                                  label: SizedBox(
                                    width: 120.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Refferal ID:'),
                                      ],
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color: Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,                        ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color: Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,                        ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color: Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black
                                          : AppColors.white,                        ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 1.w,
                                      color: Colors.red,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      );
                    },),




                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 20.w,right: 20.w),
                    child: RichText(
                      text: TextSpan(
                        text: 'Forget password?'.tr,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.light
                              ? Color(0xff9391A4)
                              : AppColors.white,
                          fontSize: 14.sp,
                        ),
                        children: [
                          // TextSpan(text: ' '),
                          TextSpan(
                            text: 'Tap here'.tr,
                            recognizer: _tapGestureRecognizer,
                            style: TextStyle(
                                color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.black
                                    : AppColors.white,
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<GetLoginController>(
                      init: GetLoginController(),
                      builder: (controller){
                    return ButtonWidget(
                      name: 'Log in'.tr,
                      onPressed: ()=>controller.loginUser(),
                    );
                  }),


                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      IconButtonWidget(
                        onPressed: () {},
                        name: 'Google',
                        img: 'assets/icon/google.png',
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      IconButtonWidget(
                        onPressed: () {},
                        name: 'Apple',
                        img: 'assets/icon/appstore.png',
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t have an account yet?'.tr,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.light
                              ? Color(0xff9391A4)
                              : AppColors.black3,
                          fontSize: 14.sp,
                        ),
                        children: [
                          // TextSpan(text: ' '),
                          TextSpan(
                            text: 'Tap here'.tr,
                            recognizer: _tapGestureRecognizer2,
                            style:
                            TextStyle(color: AppColors.purple, fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
        );


  }



}
