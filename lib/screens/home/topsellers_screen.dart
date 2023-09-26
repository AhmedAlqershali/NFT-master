import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app.colors.dart';

class TopSellersScreen extends StatefulWidget {
  const TopSellersScreen({super.key});

  @override
  State<TopSellersScreen> createState() => _TopSellersScreenState();
}

class _TopSellersScreenState extends State<TopSellersScreen> {
  int _counter=0;
  String _content = 'Hi';
  bool isfav=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : AppColors.black2,
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Top Sellers',style: GoogleFonts.roboto(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : AppColors.white,
        )),
        actions: [
          PopupMenuButton<String>(
            color: Theme.of(context).brightness == Brightness.light
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
      body: ListView.separated(
        shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(
            height: 8.h,
          ),
          itemCount: 13,
          itemBuilder: (context, index) {
            return Container(
              height: 78.h,
              width: 367.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : AppColors.black,
              ),
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
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : AppColors.white,
                        )),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text('Floor:1.66ETH',style: GoogleFonts.roboto(
                          color: Theme.of(context).brightness == Brightness.light
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
                                color:Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : AppColors.white,
                              )),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Text('= \$4.8',style: GoogleFonts.roboto(
                                    color: Theme.of(context).brightness == Brightness.light
                                        ? Colors.black
                                        : AppColors.white,
                                  )),
                                  Text('= +24.6%',style: GoogleFonts.roboto(
                                    color: Theme.of(context).brightness == Brightness.light
                                        ? Colors.black
                                        : AppColors.white,
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
    );
  }
}
