import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app.colors.dart';
import '../controller/controller_model/create_products_model.dart';

class ContainerSearchTrendingGridViewWidget extends StatelessWidget {

  ContainerSearchTrendingGridViewWidget({
    required this.productsModel,
    super.key,
  });
  CreateProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            height: 277.h,
            width: 178.w,
            child: Card(
                color: Theme.of(context).brightness == Brightness.light
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
                      height: 116.h,
                      width: 158.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.only(top: 10.h, right: 4.w, left: 4.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(productsModel.productPath!,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h,left: 10.w,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(productsModel.name!,
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400)),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.h,
                                  child: CircleAvatar(
                                    radius: 20.r,
                                    child: Image.network(productsModel.subImagePath!),
                                  ),),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text('@${productsModel.name}',
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey2
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height:10.h ,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/coin.png',
                                height: 18.h,
                                width: 18.w,
                              ),
                              SizedBox(width: 4.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('0.49 BNB',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400)),
                                  Text('≈ \$${productsModel.price}',
                                      style: GoogleFonts.roboto(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.grey2)),

                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 64.w,
                                height: 34.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color:Theme.of(context).brightness == Brightness.light
                                      ? AppColors.grey
                                      : AppColors.black2,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.favorite,size: 16,),
                                    SizedBox(width: 2.w,),
                                    Text('3000', style: GoogleFonts.roboto(
                                        color:Theme.of(context).brightness == Brightness.light
                                            ? AppColors.black2
                                            : AppColors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 18.h,
            right: 20.w,

            child: Container(
              width: 67.w,
              height: 28.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_outlined,size: 16,color: AppColors.black2,),
                  SizedBox(width: 2.w,),
                  Text('1:00:30', style: GoogleFonts.roboto(
                      color: AppColors.black2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
