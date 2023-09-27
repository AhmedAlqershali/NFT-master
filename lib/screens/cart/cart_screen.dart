import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/screens/cart/checkout_screen.dart';
import 'package:nft/widget/button_profile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter = 0;
  int _counter_addAndremove = 0;
  String _content = 'Hi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : AppColors.black2,
    appBar: AppBar(
        title: Text(
          'Cart'.tr,
          style: GoogleFonts.roboto(color: Theme.of(context).brightness == Brightness.light
              ? AppColors.black
              : AppColors.white,
              fontSize: 14.sp),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color:Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : AppColors.white, ),
        automaticallyImplyLeading: true,
        actions: [
          PopupMenuButton<String>(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.black
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
                    style: GoogleFonts.roboto(),
                  ),
                  value: 'Hi',
                  textStyle: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  child: Text('hello'),
                  value: 'hello',
                  textStyle: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  child: Text('hello hi'),
                  value: 'hello hi',
                  textStyle: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                )
              ];
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w,right: 24.w),
            child: Row(
              children: [
                Text(
                  'Cart'.tr,
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                Text('/ '),
                Text(
                  '35 items',
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Container(
                      width: 366.w,
                      height: 100.h,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color:  Theme.of(context).brightness == Brightness.light
                              ? AppColors.white
                              : AppColors.black,
                          border: Border.all(color:  Theme.of(context).brightness == Brightness.light
                              ? AppColors.white
                              : AppColors.black,)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/product1.png',
                              width: 50.w,
                              height: 50.h,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Deadzone 13 Hideout',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: 113.w,
                                  height: 40.h,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            --_counter_addAndremove;
                                          });
                                        },
                                        child: Container(
                                          width: 40.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color:  Theme.of(context).brightness == Brightness.light
                                                  ? AppColors.white
                                                  : AppColors.black,
                                              border: Border.all(
                                                  width: 2.w,
                                                  color: Colors.grey.shade400)),
                                          child: Icon(
                                            Icons.remove,
                                            color:
                                            Theme.of(context).brightness == Brightness.light
                                                ? AppColors.black
                                                : AppColors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 40.h,
                                          width: 20.w,
                                          child: Center(
                                              child: Text(
                                            _counter_addAndremove.toString(),
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp),
                                          ))),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            ++_counter_addAndremove;
                                          });
                                        },
                                        child: Container(
                                          width: 40.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: Theme.of(context).brightness == Brightness.light
                                                  ? AppColors.white
                                                  : AppColors.black,
                                              border: Border.all(
                                                  width: 2.w,
                                                  color: Colors.grey.shade400)),
                                          child: Icon(
                                            Icons.add,
                                            color:
                                            Theme.of(context).brightness == Brightness.light
                                                ? AppColors.black
                                                : AppColors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 50.w,
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    weight: 18.w,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/coin.png',
                                      fit: BoxFit.contain,
                                      height: 18.h,
                                      width: 18.h,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text('0.49 BNB',
                                        style: GoogleFonts.roboto(
                                            color:  Theme.of(context).brightness == Brightness.light
                                                ? AppColors.black
                                                : AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
              itemCount: 10),
          SizedBox(
            height: 14.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Original price'.tr,
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).brightness == Brightness.light
                                ? AppColors.black
                                : AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/coin.png',
                          fit: BoxFit.contain,
                          height: 18.h,
                          width: 18.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text('0.49 BNB',
                            style: GoogleFonts.roboto(
                                color:  Theme.of(context).brightness == Brightness.light
                                    ? AppColors.black
                                    : AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('VAT'.tr,
                        style: GoogleFonts.roboto(
                            color:  Theme.of(context).brightness == Brightness.light
                                ? AppColors.black
                                : AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/coin.png',
                          fit: BoxFit.contain,
                          height: 18.h,
                          width: 18.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text('0.49 BNB',
                            style: GoogleFonts.roboto(
                                color:  Theme.of(context).brightness == Brightness.light
                                    ? AppColors.black
                                    : AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discounted price'.tr,
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).brightness == Brightness.light
                                ? AppColors.black
                                : AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp)),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/coin.png',
                          fit: BoxFit.contain,
                          height: 18.h,
                          width: 18.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text('0.49 BNB',
                            style: GoogleFonts.roboto(
                                color:  Theme.of(context).brightness == Brightness.light
                                    ? AppColors.black
                                    : AppColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonProfileWidget(
                  name: 'Checkout'.tr,
                  onTap: () => Get.to(CheckoutScreen()),
                  nameColorBorder: AppColors.black2,
                  BackgroundColor: Colors.white),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.black2,
                      border: Border.all(width: 2.w, color: Colors.white)),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue searching'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
        ],
      ),
    );
  }
}
