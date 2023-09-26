import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app.colors.dart';

class ContainerSearchTrendingListViewWidget extends StatelessWidget {

  ContainerSearchTrendingListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(18),
      child: Stack(
        children: [
          Container(
            width: 366.w,
            height: 503.h,
            child: Card(
              color:  Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : AppColors.black,
                elevation: 10.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 334.h,
                      width: 334.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding:
                             EdgeInsets.only(top: 16.h, right: 16.w, left: 16.h),
                        child: Ink.image(
                          image: AssetImage('assets/images/product1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Deadzone 13 Hideout',
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                child: CircleAvatar(
                                  radius: 20.r,
                                  child: Image.asset('assets/images/img_profile.png'),
                                ),),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text('@marterium',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey2
                                  )),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 16.0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/coin.png',
                                      height: 24.h,
                                      width: 24.w,
                                    ),
                                    SizedBox(width: 4.w,),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('0.49 BNB',
                                            style: GoogleFonts.roboto(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400)),
                                        Text('≈ \$140.05',
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.grey2)),
                                      ],
                                    )
                                  ],
                                ),
                                ElevatedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Icon( // <-- Icon
                                    Icons.favorite,
                                    size: 24,
                                    color: AppColors.black2,
                                  ),
                                  label: Text('1.200',style: GoogleFonts.roboto(color: AppColors.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),), // <-- Text
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            top: 32.h,
            right: 32.w,
            child: ElevatedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () {},
              icon: Icon( // <-- Icon
                Icons.favorite,
                size: 24.0,
                color: AppColors.black2,
              ),
              label: Text('1.200',style: GoogleFonts.roboto(color: AppColors.black2,fontSize: 14.sp,fontWeight: FontWeight.w400),), // <-- Text
            ),
          ),
        ],
      ),
    );
  }
}
