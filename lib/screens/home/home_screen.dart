import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/screens/home/Favorites_Screen.dart';
import 'package:nft/screens/home/collections_screen.dart';
import 'package:nft/screens/home/topsellers_screen.dart';
import 'package:nft/screens/product_page/product_page_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  String _content = 'Hi';
  bool fav = false;

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        backgroundColor:
        Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : AppColors.black2,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            color:  Theme.of(context).brightness == Brightness.light
                ? Colors.black
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
      body: Container(
        color:
        Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : AppColors.black2,
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 97.h,
                width: 69.w,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20.w,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 22.w,
                          ),
                          Container(
                            height: 74.h,
                            width: 74.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.r),
                                color: AppColors.grey),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 54.h,
                                width: 54.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.r),
                                ),
                                child: Image.asset(
                                  'assets/images/art.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Text('Art', style: GoogleFonts.roboto(
                            color: Theme.of(context).brightness == Brightness.light
                                ? AppColors.black
                                : Colors.grey.shade100,
                          ))
                        ],
                      );
                    }),
              ),
              //Favorites
              Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Favorites'.tr,style: GoogleFonts.roboto(
                      color:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    ),),
                    GestureDetector(
                      onTap: ()=>Get.to(FavoritesScreen()),
                      child: Row(
                        children: [Text('See all'.tr,style: GoogleFonts.roboto(
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : AppColors.white,
                        ),), Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),


              GestureDetector(
                onTap: ()=>Get.to(ProductPageScreen()),
                child: SizedBox(
                  height: 450.h,
                  width: 311.w,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            width: 12.w,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 18.w,right: 18.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                color: Colors.white),
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
                                                color: Colors.white.withOpacity(0.75)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.access_time_outlined,color: AppColors.black2,),
                                                Text('05:22',style: GoogleFonts.roboto(
                                                  color:AppColors.black2,
                                                ),)
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ),



                                Padding(
                                  padding: EdgeInsets.only(left: 16.w, top: 16.h,right: 16.h),
                                  child: Text(
                                    'Deadzone 13 Hideout',
                                    style: GoogleFonts.roboto(
                                        color: AppColors.black2, fontSize: 18.sp),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.w, top: 16.w,right: 16.w),
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
                                        color: Colors.black,
                                      ),)
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.w, top: 16.w,right: 16.w),
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
                                        color: Colors.black,
                                      )),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text('= \$140.5',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          )),
                                        ],
                                      ),
                                      SizedBox(width: 126.w,),
                                      Container(
                                        height: 36.h,
                                        width: 64.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: Colors.grey.shade200),
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
                                              color: Colors.black,
                                            ))
                                          ],
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
              ),
              SizedBox(
                height: 20.h,
              ),
              //Top Sellers
              Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 20.h, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Sellers'.tr,style: GoogleFonts.roboto(
                      color:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : AppColors.white,
                    )),
                    GestureDetector(
                      onTap: () => Get.to(TopSellersScreen()),
                      child: Row(
                        children: [Text('See all'.tr,style: GoogleFonts.roboto(
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : AppColors.white,
                        )), Icon(Icons.arrow_forward_ios)],
                      ),
                    )
                  ],
                ),
              ),

              TabBar(
                  controller: _tabController,
                  indicatorColor:
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.white,
                  labelColor:
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : AppColors.white,
                  tabs: [
                    Tab(
                      text: '1 day'.tr,

                    ),
                    Tab(
                      text: '7 day'.tr,
                    ),
                    Tab(
                      text: '30 day'.tr,
                    ),
                  ]),
              SizedBox(
                height: 24.h,
              ),
              Container(
                child: SizedBox(
                  height: 250,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w,right: 15.w),
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 8.h,
                                ),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 78.h,
                                width: 367.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color:
                                    Theme.of(context).brightness == Brightness.light
                                        ? Colors.white
                                        : AppColors.black,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                        right: 16.w
                                      ),
                                      child: Text((index + 1).toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Image.asset(
                                        'assets/images/img_profile.png',
                                        fit: BoxFit.contain,
                                        height: 44.h,
                                        width: 44.h,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10.w, top: 17.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('@marterium',style: GoogleFonts.roboto(
                                            color:
                                            Theme.of(context).brightness == Brightness.light
                                                ? Colors.black
                                                : AppColors.white,
                                          )),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text('Floor:1.66ETH',style: GoogleFonts.roboto(
                                            color:
                                            Theme.of(context).brightness == Brightness.light
                                                ? Colors.black
                                                : AppColors.white,
                                          ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 14.w,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 40.h, top: 21.h),
                                            child: Image.asset(
                                              'assets/images/coin.png',
                                              fit: BoxFit.contain,
                                              height: 16.h,
                                              width: 16.h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 20.h),
                                            child: Column(
                                              children: [
                                                Text('475.98 BNB',style: GoogleFonts.roboto(
                                                  color:
                                                  Theme.of(context).brightness == Brightness.light
                                                      ? Colors.black
                                                      : AppColors.white,
                                                )),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('\$4.8',style: GoogleFonts.roboto(
                                                      color:
                                                      Theme.of(context).brightness == Brightness.light
                                                          ? Colors.black
                                                          : AppColors.white,
                                                    )),
                                                    SizedBox(width: 2.w,),
                                                    Text('+24.6%',style: GoogleFonts.roboto(
                                                      color:
                                                      Theme.of(context).brightness == Brightness.light
                                                          ? Colors.black
                                                          : AppColors.lightGreen,
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w,right: 15.w),
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 8.h,
                                ),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 78.h,
                                width: 367.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                      ),
                                      child: Text((index + 1).toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Image.asset(
                                        'assets/images/img_profile.png',
                                        fit: BoxFit.contain,
                                        height: 44.h,
                                        width: 44.h,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10.w, top: 17.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('@marterium',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          )),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text('Floor:1.66ETH',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 14.w,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 40.h, top: 21.h),
                                            child: Image.asset(
                                              'assets/images/coin.png',
                                              fit: BoxFit.contain,
                                              height: 16.h,
                                              width: 16.h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 20.h),
                                            child: Column(
                                              children: [
                                                Text('475.98 BNB',style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                )),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('= \$4.8',style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                    )),
                                                    Text('= +24.6%',style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w,right: 15.w),
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 8.h,
                                ),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 78.h,
                                width: 367.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.w,
                                      ),
                                      child: Text((index + 1).toString()),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Image.asset(
                                        'assets/images/img_profile.png',
                                        fit: BoxFit.contain,
                                        height: 44.h,
                                        width: 44.h,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10.w, top: 17.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('@marterium',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          )),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text('Floor:1.66ETH',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 14.w,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 40.h, top: 21.h),
                                            child: Image.asset(
                                              'assets/images/coin.png',
                                              fit: BoxFit.contain,
                                              height: 16.h,
                                              width: 16.h,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 20.h),
                                            child: Column(
                                              children: [
                                                Text('475.98 BNB',style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                )),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('= \$4.8',style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                    )),
                                                    Text('= +24.6%',style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),

//Collections
              GestureDetector(
                onTap: ()=>Get.to(CollectionsScreen()),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 24.w, right: 24.w, top: 20.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Collections'.tr,style: GoogleFonts.roboto(
                        color:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : AppColors.white,
                      )),
                      Row(
                        children: [Text('See all'.tr,style: GoogleFonts.roboto(
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : AppColors.white,
                        )), Icon(Icons.arrow_forward_ios)],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 270.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()=>Get.to(CollectionsScreen()),
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/background_profile.png',
                                  fit: BoxFit.contain,
                                  height: 151.h,
                                ),
                                Positioned(
                                    top: 121.h,
                                    left: 40.w,
                                    child: CircleAvatar(
                                      child: Image.asset(
                                        'assets/images/img_profile.png',
                                        fit: BoxFit.contain,
                                        width: 56.w,
                                        height: 56.h,
                                      ),
                                    )),
                                Positioned(
                                    top: 177.h,
                                    left: 20.w,
                                    right: 20.w,
                                    child: Row(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Bored Ape Yacht Club /',style: GoogleFonts.roboto(
                                          color: Colors.black,
                                        )),
                                        Text('2,7K owners',style: GoogleFonts.roboto(
                                          color: Colors.grey,
                                        )),
                                      ],
                                    )),
                                Positioned(
                                  top: 214.h,
                                  left: 16.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.w),
                                        child: Text('Total volume'.tr,style: GoogleFonts.roboto(
                                          color: Colors.black,
                                        )),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
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
                                          Text('475.98 BNB',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  top: 214.h,
                                  left: 180.w,
                                  right: 14.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.w,right: 12.w),
                                        child: Text('Floor',style: GoogleFonts.roboto(
                                          color: Colors.black,
                                        )),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Row(
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
                                          Text('72 BNB',style: GoogleFonts.roboto(
                                            color: Colors.black,
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 16.h,
                        ),
                    itemCount: 4),
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
