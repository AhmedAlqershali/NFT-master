import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/api/controller/auth_api_controller.dart';
import 'package:nft/api/models/process_response.dart';
import 'package:nft/api/models/user.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/screens/auth/sign_in.dart';
import 'package:nft/utils/context_extension.dart';
import 'package:nft/widget/button_widget.dart';
import 'package:nft/widget/icon_button_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUPState();
}

class _SignUPState extends State<SignUp> {
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;

  String? _passwordError;
  bool _showPassword = false;
  bool _check = false;

  @override
  void initState() {
    super.initState();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color:  Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade100
              : AppColors.black2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.h, left: 20.w, bottom: 20.h),
                child: Text(
                  'Sign up',
                  style: GoogleFonts.roboto(
                      fontSize: 26.sp,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.black
                          : AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _phoneTextController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      label: SizedBox(
                        width: 120.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone number '),
                            Text(
                              " *",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Colors.red,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _passwordTextController,
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
                            Text('Password '),
                            Text(
                              " *",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: Icon(
                          _showPassword ? Icons.visibility_off : Icons.visibility,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : AppColors.white,                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2.w,
                          color: Colors.red,
                        ),
                      )),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.black12,
                    focusColor: Colors.white,
                    checkColor: AppColors.black,
                    value: _check,
                    onChanged: (value) {
                      setState(() {
                        _check = !_check;
                      });
                    },
                  ),
                  Text(
                    'I have read and agree to BnB Terms of Service\n and Private Policy',
                    style: TextStyle(color: AppColors.grey2),
                  ),
                ],
              ),
              ButtonWidget(
                  name: 'Create personal account',
                  onPressed: () =>_performRegister() ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    _controlErrors();
    if (_phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(
        message: "Insert required data", erorr: true);
    return false;
  }

  void _controlErrors() {}

  Future<void> _register() async {
    ProcessResponse processResponse = await AuthApiController()
        .register(user);
    if (processResponse.success) {
      Get.back();
    }
    print(user);
    context.showSnackBar(message: processResponse.message, erorr: !processResponse.success);
  }

  User get user {
    User user = User();
    user.phoneNumber = _phoneTextController.text;
    user.password = _passwordTextController.text;
    return user;
    }
}

