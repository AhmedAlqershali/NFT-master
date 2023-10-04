import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/constants/app.theme.dart';
import 'package:nft/controller/getx_controller/get_delete_controller.dart';
import 'package:nft/lang/locale_controller.dart';
import 'package:nft/screens/account/edit_details_screen.dart';
import 'package:nft/screens/auth/sign_in.dart';
import 'package:nft/widget/card_setting_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _content = 'Hi';
  String? _chosenValue;
  int? _counter;
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
    _getThemeStatus();
    }


  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();

    return Scaffold(
      backgroundColor:
      Theme.of(context).brightness == Brightness.light
        ? Colors.grey.shade100
        : AppColors.black2,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color:Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : AppColors.white, ),

          automaticallyImplyLeading: true,
          // backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Settings'.tr,
            style: GoogleFonts.roboto(
              color:
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : AppColors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<String>(
              color:  Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : AppColors.white,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.white)),
              onSelected: (value) {
                if (value != _content) {
                  setState(() {
                    _content = value;
                    _counter = 0;
                  });
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(

                    child: Text(
                      'Hi',
                    ),
                    value: 'Hi',
                    textStyle: GoogleFonts.roboto(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text('hello'),
                    value: 'hello',
                    textStyle: GoogleFonts.roboto(
                      color:  Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Text('hello hi',),
                    value: 'hello hi',
                    textStyle: GoogleFonts.roboto(
                      color:  Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    ),
                  )
                ];
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings'.tr,
                    style: GoogleFonts.roboto(
                        color:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CardSettingWidget(
                      onPressed: ()=>Get.to(EditDetailsScreen()),
                      // onPressed: () => Get.to(EditDetailsScreen()),
                      icon: Icons.edit_outlined,
                      name: 'Change my details'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  CardSettingWidget(
                      onPressed: () {},
                      // onPressed: () =>Get.to(ChangePasswordScreen()),
                      icon: Icons.lock_outlined,
                      name: 'Change Password'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  CardSettingWidget(
                      onPressed: () {},
                      // onPressed: () =>Get.to(PaymentSettingsScreen()),
                      icon: Icons.payment_outlined,
                      name: 'Payment Settings'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 366.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      color:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : AppColors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 21.w,),
                        Icon(Icons.language),
                        SizedBox(width: 16.w,),

                        Text("Change Language".tr,style: GoogleFonts.roboto(
                            color:Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp
                        ),),
                        SizedBox(width: 30.w,),
                        DropdownButton<String>(
                          focusColor:Colors.white,
                          value: _chosenValue,
                          //elevation: 5,
                          style: GoogleFonts.roboto(color: Colors.white),
                          iconEnabledColor:Colors.white,
                          items: <String>[
                            'English'.tr , 'Arabic'.tr
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(value,style:GoogleFonts.roboto(           color:Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,),),
                              ),
                            );
                          }).toList(),
                          hint:Center(
                            child: Text(
                              'English'.tr,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _chosenValue = value;
                              if(_chosenValue == 'Arabic' || _chosenValue == 'عربي'){
                                controllerLang.changeLang("ar");
                              }else if (_chosenValue == 'English' || _chosenValue == 'إنجليزي'){
                                controllerLang.changeLang("en");
                              }else{
                                controllerLang.changeLang("en");
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 366.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      color:Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : AppColors.black,                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 21.w,),
                        Icon(Icons.dark_mode,color:Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,),
                        SizedBox(width: 16.w,),
                        Text("Dark Mode".tr,style: GoogleFonts.roboto(
                            color:Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp
                        ),),
                        SizedBox(width: 30.w,),

                        ObxValue(
                              (data) => Switch(
                            activeColor: AppColors.purple,
                            value: isLightTheme.value,
                            onChanged: (val) {
                              isLightTheme.value = val;
                              Get.changeThemeMode(
                                isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                              );
                              _saveThemeStatus();
                            },
                          ),
                          false.obs,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CardSettingWidget(
                      onPressed: () {},
                      icon: Icons.check_outlined,
                      name: 'Product verification'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  CardSettingWidget(
                      onPressed: () {},
                      // onPressed: () =>Get.to(NotificationScreen()),
                      icon: Icons.notifications_none_outlined,
                      name: 'Notifications'.tr),
                  SizedBox(
                    height: 10.h,
                  ),
                  GetBuilder<GetDeleteController>(
                      init: GetDeleteController(),
                      builder: (controller){
                    return CardSettingWidget(
                        onPressed: ()async {
                          setState(() {
                            controller.deleteAccount();
                          });
                          await Get.offAll(SignIn());

                        },
                        icon: Icons.delete_outline_outlined,
                        name: 'Delete account'.tr);
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  CardSettingWidget(
                      onPressed: () {},
                      icon: Icons.logout_outlined, name: 'Logout'.tr),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            ),
        );
    }
}