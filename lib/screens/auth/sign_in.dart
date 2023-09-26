import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/screens/auth/sign_up.dart';
import 'package:nft/screens/bn_screen.dart';
import 'package:nft/screens/home/home_screen.dart';
import 'package:nft/widget/button_widget.dart';
import 'package:nft/widget/edit_text_widget.dart';
import 'package:nft/widget/icon_button_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;

  String? _passwordError;
  String? _phoneError;
  bool _showPassword = false;
  late TapGestureRecognizer _tapGestureRecognizer;
  late TapGestureRecognizer _tapGestureRecognizer2;

  @override
  void initState() {
    super.initState();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _navigateToRegister;
    _tapGestureRecognizer2 = TapGestureRecognizer()
      ..onTap = _navigateToRegister2;
    // _tapGestureRecognizer.onTap = _navigateToRegister;
  }

  void _navigateToRegister() =>
      Navigator.pushNamed(context, '/register_screen');

  void _navigateToRegister2() =>
      Get.to(SignUp());

  @override
  void dispose() {
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    _tapGestureRecognizer.dispose();
    _tapGestureRecognizer2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade100
              : AppColors.black2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h, left: 20.w, bottom: 20.h),
                child: Text(
                  'Log in',
                  style: GoogleFonts.roboto(
                      fontSize: 26.sp,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.black
                          : AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              EditTextWidget(star: '*',controller: _phoneTextController,name: 'Phone number',size: 20,),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
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
                              style: TextStyle(color:  Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black
                                  : AppColors.white,),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color:  Theme.of(context).brightness == Brightness.light
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
                          _showPassword ? Icons.visibility_off : Icons.visibility,
                          color:  Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color:  Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color:  Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: AppColors.red,
                        ),
                      )),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 20.w),
                child: RichText(
                  text: TextSpan(
                    text: 'Forget password ? ',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                        ? Color(0xff9391A4)
                        : AppColors.white,
                      fontSize: 14.sp,
                    ),
                    children: [
                      // TextSpan(text: ' '),
                      TextSpan(
                        text: 'Tap here',
                        recognizer: _tapGestureRecognizer,
                        style:
                            TextStyle(color: Theme.of(context).brightness == Brightness.light
                                ? AppColors.black
                                : AppColors.white, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ButtonWidget(name: 'Log in',onPressed: ()=>Get.offAll(BnScreen()),),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButtonWidget(
                    onPressed: (){},
                    name: 'Google',
                    img: 'assets/icon/google.png',
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButtonWidget(
                    onPressed: (){},
                    name: 'Apple',
                    img: 'assets/icon/appstore.png',
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account yet ? ',
                    style: TextStyle(
                      color:
                      Theme.of(context).brightness == Brightness.light
                          ? Color(0xff9391A4)
                          : AppColors.black3,
                      fontSize: 14.sp,
                    ),
                    children: [
                      // TextSpan(text: ' '),
                      TextSpan(
                        text: 'Tap here',
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
