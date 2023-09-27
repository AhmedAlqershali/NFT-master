import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';

class ContainerSearchUsersWidget extends StatelessWidget {

  String num;

  ContainerSearchUsersWidget({
    super.key,

    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366.w,
      height: 160.h,
      child: Card(
        color:  Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : AppColors.black,
        elevation: 10,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              title:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 4.0),
                        child: Text(num),
                      ),
                      Image.asset(
                        'assets/images/img_profile.png',
                        height: 44.h,
                        width: 44.w,
                      ),
                      Text("@Marteriu",style: GoogleFonts.roboto(fontSize: 14.sp,fontWeight: FontWeight.w700,)),
                    ],
                  ),
                  Container(
                    width: 94.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xFFEBE7FF),
                    ),
                    child: Center(
                      child: GestureDetector(
                        child: Text(
                          'Following'.tr,
                          style: GoogleFonts.roboto(fontSize: 16.sp,color: AppColors.purple,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding:  EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Volume".tr,
                                  style: GoogleFonts.roboto(fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.grey2),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Icon(Icons.info_outline,size: 14,)
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            Text(
                              "15,085,035.95",
                              style: GoogleFonts.roboto(fontSize: 16.sp,fontWeight: FontWeight.w400,color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black2
                                  : AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sales".tr,
                                  style: GoogleFonts.roboto(fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.grey2),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Icon(Icons.info_outline,size: 14,)
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            Text(
                              "111,850",
                              style: GoogleFonts.roboto(fontSize: 16.sp,fontWeight: FontWeight.w400,color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black2
                                  : AppColors.white,),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Items".tr,
                                  style: GoogleFonts.roboto(fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.grey2),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Icon(Icons.info_outline,size: 14,)
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            Text(
                              "50,850",
                              style: GoogleFonts.roboto(fontSize: 16.sp,fontWeight: FontWeight.w400,color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black2
                                  : AppColors.white,),
                            ),

                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Followers".tr,
                                  style: GoogleFonts.roboto(fontSize: 12.sp,fontWeight: FontWeight.w500,color: AppColors.grey2),
                                ),
                                SizedBox(
                                  width:4.w,
                                ),
                                Icon(Icons.info_outline,size: 14,)
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            Text(
                              "10,150",
                              style: GoogleFonts.roboto(fontSize: 16.sp,fontWeight: FontWeight.w400,color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black2
                                  : AppColors.white,),
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
