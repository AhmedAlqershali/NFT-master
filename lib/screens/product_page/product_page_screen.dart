import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/screens/product_page/activity_screen.dart';
import 'package:nft/widget/button_profile_widget.dart';
import 'package:nft/widget/card_activity_widget.dart';

class ProductPageScreen extends StatefulWidget {
  const ProductPageScreen({super.key});

  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> {
  String _content = 'Hi';
  int _counter = 0;
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : AppColors.black2,
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Product Page',style: GoogleFonts.roboto(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.black
              : AppColors.white,
        ),),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            color: Theme.of(context).brightness == Brightness.light
          ? AppColors.black
          : AppColors.white,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                    color: Colors.white
                )
            ),
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
                  child: Text('Hi',style: GoogleFonts.roboto(),),
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
      body:Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w
        ),
      child: ListView(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/product1.png',
                fit: BoxFit.cover,

                width: 366.w,height: 366.h,),
              Positioned(
                top: 16.h,
                left: 260.w,
                right: 14.w,
                child: Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey.shade50.withOpacity(0.75)
                  ),
                  child: Icon(Icons.favorite_border_outlined,color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : AppColors.black,),
                ),
              )

            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h),
            child: Text(
              'Bored Ape Yacht Club',
              style: GoogleFonts.roboto(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.black2
                      : AppColors.white
                  , fontSize: 28.sp,fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.w),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/img_profile.png',
                  fit: BoxFit.cover,
                  height: 30.h,
                  width: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text('created by: ',style: GoogleFonts.roboto(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black2
                        : AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp
                ),),
                Text('@marterium',style: GoogleFonts.roboto(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black2
                        : AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp

                ),),
              ],
            ),
          ),
          SizedBox(height:24.h ,),
          Container(
            height: 120.h,
            width: 366.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Price',style: GoogleFonts.roboto(
                        color: AppColors.black2,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp
                    ),),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            fit: BoxFit.contain,
                            height: 16.h,
                            width: 16.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            children: [
                              Text('0.49 BNB',style: GoogleFonts.roboto(
                                color: Colors.black,
                              )),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text('= \$140.05',style: GoogleFonts.roboto(
                                color: Colors.black,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width:50.w ,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Highest floor bid',style: GoogleFonts.roboto(
                        color: AppColors.black2,
                        fontWeight: FontWeight.w400,
                      fontSize: 14.sp
                    ),),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            fit: BoxFit.contain,
                            height: 16.h,
                            width: 16.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            children: [
                              Text('2.2 BNB',style: GoogleFonts.roboto(
                                color: Colors.black,
                              )),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text('by marterium',style: GoogleFonts.roboto(
                                color: Colors.black,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(height:24.h ,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Last sale price:'),
              SizedBox(width:10.w ,),

              Image.asset(
                'assets/images/coin.png',
                fit: BoxFit.contain,
                height: 16.h,
                width: 16.h,
              ),
              SizedBox(width:6.w ,),

              Text('0.7 BNB'),
            ],
          ),
          SizedBox(height:24.h ,),
          Container(
            height: 120.h,
            width: 366.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.white
                    : AppColors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/coin.png',
                                fit: BoxFit.contain,
                                height: 16.h,
                                width: 16.h,
                              ),
                              SizedBox(width:10.w,),
                              Text('Ethereum (ERC-721)'),
                            ],
                          ),
                          SizedBox(height:16.h,),

                          Row(
                            children: [
                              Icon(Icons.pie_chart_outline,size: 18,),
                              SizedBox(width:10.w,),
                              Text('View on Etherscan'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/picture.png',
                                fit: BoxFit.contain,
                                height: 16.h,
                                width: 16.h,
                              ),
                              SizedBox(width:10.w,),
                              Text('Ethereum (ERC-721)'),
                            ],
                          ),
                          SizedBox(height:16.h,),

                          Row(
                            children: [
                              Icon(Icons.refresh_outlined,size: 18,),
                              SizedBox(width:10.w,),
                              Text('Refresh Metadata'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, top: 20.h, bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Activity',style: GoogleFonts.roboto(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp
                )),
                GestureDetector(
                  onTap: ()=>Get.to(ActivityScreen()),
                  child: Row(
                    children: [Text('See all',style: GoogleFonts.roboto(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    )), Icon(Icons.arrow_forward_ios)],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:24.h ,),
          ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index) =>ContainerActivityWidget(
              img: 'assets/images/img_profile.png',
              name: 'ahmed',
              num: '100'),
              separatorBuilder: (context, index) => SizedBox(height: 4.h,),
              itemCount: 3
          ),
           SizedBox(
              height: 450.h,
             child: ListView.separated(
               shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  width: 12.w,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          color:Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade100
                              : AppColors.black,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16.w, top: 16.h, right: 16.w),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Colors.black,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/product1.png',
                                    fit: BoxFit.cover,
                                    width: 279.w,
                                    height: 281.h,

                                  ),
                                ),
                                Positioned(
                                    left: 183.w,
                                    top: 16.h,
                                    right: 16.w,
                                    child: Container(
                                      height: 34.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8.r),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.access_time_outlined,
                                            color: Theme.of(context).brightness == Brightness.light
                                                ? AppColors.white
                                                : AppColors.black2,),
                                          Text('05:22',style: GoogleFonts.roboto(
                                            color: Theme.of(context).brightness == Brightness.light
                                                ? AppColors.white
                                                : AppColors.black2,
                                          ),)
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),



                          Padding(
                            padding: EdgeInsets.only(left: 16.w, top: 16.h),
                            child: Text(
                              'Deadzone 13 Hideout',
                              style: GoogleFonts.roboto(
                                  color: Theme.of(context).brightness == Brightness.light
                                  ? AppColors.black2
                                  : AppColors.white,
                                  fontSize: 18.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w, top: 16.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/img_profile.png',
                                  fit: BoxFit.contain,
                                  height: 30.h,
                                  width: 30.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text('@marterium',style: GoogleFonts.roboto(
                                  color: Theme.of(context).brightness == Brightness.light
                                      ? AppColors.black2
                                      : AppColors.white,
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w, top: 16.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/coin.png',
                                  fit: BoxFit.contain,
                                  height: 30.h,
                                  width: 30.h,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Text('0.49 BNB',style: GoogleFonts.roboto(
                                      color: Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black2
                                          : AppColors.white,
                                    )),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text('= \$140.5',style: GoogleFonts.roboto(
                                      color: Theme.of(context).brightness == Brightness.light
                                          ? AppColors.black2
                                          : AppColors.white,
                                    )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 126.w,
                                    right: 16.w,
                                  ),
                                  child: Container(
                                    height: 36.h,
                                    width: 64.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8.r),
                                        color:Theme.of(context).brightness == Brightness.light
                                        ? Colors.grey.shade200.withOpacity(0.75)
                                        : AppColors.black2,),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              fav = !fav;
                                            });
                                          },
                                          child: fav
                                              ? Icon(Icons
                                              .favorite_border_outlined)
                                              : Icon(Icons.favorite),
                                        ),
                                        Text('34',style: GoogleFonts.roboto(
                                          color: Theme.of(context).brightness == Brightness.light
                                            ? AppColors.black
                                            : AppColors.white,
                                        ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
           ),
          SizedBox(
          height: 28.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonProfileWidget(name: 'Place bid',
                  onTap: (){},
                  nameColorBorder: Colors.white,
                  BackgroundColor: Colors.black),
              ButtonProfileWidget(name: 'Buy for 2.2 BNB',
                  onTap: (){},
                  nameColorBorder: Colors.black,
                  BackgroundColor: Colors.white),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),



        ],
      ) ,
      ),
    );
  }
}
