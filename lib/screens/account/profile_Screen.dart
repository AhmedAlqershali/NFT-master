import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/controller/controller_model/users_model.dart';
import 'package:nft/controller/services/get_user_profile.dart';
import 'package:nft/prefs/shared_pref_controller.dart';
import 'package:nft/screens/account/settings_screen.dart';
import 'package:nft/widget/button_profile_widget.dart';
import 'package:nft/widget/card_profile_widget.dart';

import '../../constants/app.colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade100 : AppColors.black2,
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Get.to(SettingsScreen()),
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).brightness == Brightness.light ? AppColors.black : AppColors.white,
            ),
          ),
        ],
      ),

      body:GetBuilder<AllUsersService>(
        init: AllUsersService(),
        builder: (controller){
          controller.GetUserById( SharedPrefController().getValue<String>(PrefKeys.id.name)!);
          print( SharedPrefController().getValue<String>(PrefKeys.id.name)!);
          print(UsersModel().token);
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 16.h),
                child: Container(
                  height: 120.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/background_profile.png',
                        fit: BoxFit.cover,
                        width: double.infinity.w,
                        height: 100.h,
                      ),
                      Positioned(
                        left: 140.w,
                        top: 50.h,
                        child: SizedBox(
                          height: 75.h,
                          width: 75.w,
                          child: CircleAvatar(
                            radius: 150,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/img_profile.png', // يمكن استبداله بصورة المستخدم الفعلية
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 78.w, right: 80.w, top: 16.h),
                child: Container(
                  child: Text(
                    '@YFI Fan', // يمكن استبداله باسم المستخدم الفعلي
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).brightness == Brightness.light ? AppColors.black : AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w, right: 25.w, top: 16.h),
                child: Container(
                  child: Text(
                    'Artist / Creative Director / #NFT ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).brightness == Brightness.light ? Color(0xFF232632) : AppColors.grey2,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  ContainerProfileWidget(img: 'assets/images/img_profile.png', name: 'XCUR Traded', num: '321K'),
                  SizedBox(
                    width: 8.w,
                  ),
                  ContainerProfileWidget(img: 'assets/images/img_profile.png', name: 'XCUR Traded', num: '321K'),
                  SizedBox(
                    width: 8.w,
                  ),
                  ContainerProfileWidget(img: 'assets/images/img_profile.png', name: 'XCUR Traded', num: '321K'),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonProfileWidget(
                    name: 'Follow'.tr,
                    onTap: () {},
                    nameColorBorder: Colors.black,
                    BackgroundColor: Colors.white,
                  ),
                  ButtonProfileWidget(
                    name: 'Message'.tr,
                    onTap: () {},
                    nameColorBorder: Colors.white,
                    BackgroundColor: Colors.black,
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Theme.of(context).brightness == Brightness.light ? Colors.white : AppColors.black,
                    ),
                    child: Icon(Icons.share_outlined),
                  )
                ],
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).brightness == Brightness.light ? AppColors.black : AppColors.white,
                labelColor: Theme.of(context).brightness == Brightness.light ? AppColors.black : AppColors.white,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    text: 'Created'.tr,
                  ),
                  Tab(
                    text: 'Owned'.tr,
                  ),
                  Tab(
                    text: 'Collections'.tr,
                  ),
                  Tab(
                    text: 'Splits'.tr,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                child: SizedBox(
                  height: 1000,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // العرض الخاص بـ "Created"
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                          childAspectRatio: 445 / 450,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 10.w),
                              child: Card(
                                child: Image.asset(
                                  'assets/images/product1.png', // استبداله بصورة المنتج الفعلي
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // العرض الخاص بـ "Owned"
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                          childAspectRatio: 445 / 450,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 10.w),
                              child: Card(
                                child: Image.asset(
                                  'assets/images/product1.png', // استبداله بصورة المنتج الفعلي
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // العرض الخاص بـ "Collections"
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                          childAspectRatio: 445 / 450,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 10.w),
                              child: Card(
                                child: Image.asset(
                                  'assets/images/product1.png', // استبداله بصورة المنتج الفعلي
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // العرض الخاص بـ "Splits"
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 11,
                          childAspectRatio: 445 / 450,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.h, left: 10.w),
                              child: Card(
                                child: Image.asset(
                                  'assets/images/product1.png', // استبداله بصورة المنتج الفعلي
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),


    );
  }
}
