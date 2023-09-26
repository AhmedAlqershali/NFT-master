import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app.colors.dart';

class ContainerSearchCollectionsListViewWidget extends StatelessWidget {

  ContainerSearchCollectionsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.only(right: 24.w,left: 24.w),
      child: SizedBox(
        width: 366.w,
        height: 359.h,
        child: Card(
          color:  Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : AppColors.black,
            elevation: 10.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 220.h,
                      width: 366.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Ink.image(
                        image: AssetImage('assets/images/product1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 25.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                width: 8.w,
                              ),
                              Text('Bored Ape Yacht Club /',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.sp, fontWeight: FontWeight.w400)),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '34,7K owners',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey2),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Total voume',
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey2),
                                  ),
                                  SizedBox(height: 4.h,),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/coin.png',
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(width: 8.w,),
                                      Text('795,6K BNB',
                                          style: GoogleFonts.roboto(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400)),

                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                  height: 36.h,
                                  child: Row(children: [
                                    VerticalDivider(
                                      color: AppColors.black2.withOpacity(0.15),
                                      thickness: 1, //thickness of divier line
                                    ),
                                  ])),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Floor',
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey2),
                                  ),
                                  SizedBox(height: 4.h,),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/coin.png',
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(height: 8.w,),
                                      Text('72 BNB',
                                          style: GoogleFonts.roboto(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400)),

                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 165.h,
                  left: 16.w,
                  width: 56.w,
                  height: 56.h,
                  child: CircleAvatar(
                    radius: 20.r,
                    child: Image.asset('assets/images/img_profile.png'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
