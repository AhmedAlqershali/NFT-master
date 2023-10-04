import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/card_search_collections_gridview_widget.dart';

import '../../controller/controller_model/collections.dart';
import '../../controller/controller_model/details_collections_model.dart';
import '../../controller/services/get_all_collections.dart';

class CollectionsScreen extends StatefulWidget {
  CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  var id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var id = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData.fallback(),
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.transparent
              : AppColors.black2,
          elevation: 0,
          title: Center(
            child: Text(
              'Collections',
              style: GoogleFonts.roboto(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : AppColors.white,
              ),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : AppColors.white,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.white)),
              onSelected: (value) {},
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
        body: SingleChildScrollView(
          child:
          FutureBuilder<CollectionsDetailsModel>(
              future: AllCollectionsService().getDetailsCollection(id: id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data available');
                } else {
                  final detailsCollections = snapshot.data!;
                  return Container(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade100
                        : AppColors.black2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                // Image border
                                child: Center(
                                  child:  Image.network(
                                      'http://storesuadia-001-site1.etempurl.com/${detailsCollections.collectionImagePath}',
                                      fit: BoxFit.cover,
                                      width: 366,
                                      height: 100
                                  ),

                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                detailsCollections.collectionName!,
                                style: GoogleFonts.roboto(
                                  color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? AppColors.black2
                                      : AppColors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18, // Image radius
                                    backgroundImage:
                                    AssetImage('assets/images/img_profile.png'),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'created by: ',
                                    style: GoogleFonts.roboto(
                                      color: Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black2
                                          : AppColors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '@marterium',
                                    style: GoogleFonts.roboto(
                                      color: Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black2
                                          : AppColors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 28.h,
                              ),
                              Text(
                                'A handcrafted collection of 10,000 characters developed by artist DirtyRobot. Each with their own identity to be discovered within the wider stories of RENGA. In its purest form, RENGA is the art of storytelling. ',
                                style: GoogleFonts.roboto(
                                  color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? AppColors.black.withOpacity(0.8)
                                      : AppColors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Container(
                                width: 366,
                                height: 222,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    side: BorderSide(
                                      color: AppColors.white,
                                    ),
                                  ),
                                  elevation: 10,
                                  color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? AppColors.white
                                      : AppColors.black2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Floor',
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/coin.png',
                                                  width: 18,
                                                  height: 18,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  '72 BNB',
                                                  textAlign: TextAlign.right,
                                                  style: GoogleFonts.roboto(
                                                    color:
                                                    Theme.of(context).brightness ==
                                                        Brightness.light
                                                        ? AppColors.black2
                                                        : AppColors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total volume',
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/coin.png',
                                                  width: 18,
                                                  height: 18,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  '795,6K BNB',
                                                  textAlign: TextAlign.right,
                                                  style: GoogleFonts.roboto(
                                                    color:
                                                    Theme.of(context).brightness ==
                                                        Brightness.light
                                                        ? AppColors.black2
                                                        : AppColors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Items',
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              '8,5K',
                                              textAlign: TextAlign.right,
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Owners',
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '21,6K',
                                                  textAlign: TextAlign.right,
                                                  style: GoogleFonts.roboto(
                                                    color:
                                                    Theme.of(context).brightness ==
                                                        Brightness.light
                                                        ? AppColors.black2
                                                        : AppColors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Address',
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '0x394...da91',
                                                  textAlign: TextAlign.right,
                                                  style: GoogleFonts.roboto(
                                                    color:
                                                    Theme.of(context).brightness ==
                                                        Brightness.light
                                                        ? AppColors.black2
                                                        : AppColors.white,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Image.asset(
                                                  'assets/icon/listview.png',
                                                  color: Theme.of(context).brightness ==
                                                      Brightness.light
                                                      ? Colors.black
                                                      : AppColors.white,
                                                  width: 18,
                                                  height: 18,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'More from collection',
                                    style: GoogleFonts.roboto(
                                      color: Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black2
                                          : AppColors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'price: ',
                                        style: GoogleFonts.roboto(
                                          color: Theme.of(context).brightness ==
                                              Brightness.light
                                              ? AppColors.black2
                                              : AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      DropdownButton(
                                        value: "New York",
                                        style: GoogleFonts.roboto(
                                          color: Theme.of(context).brightness ==
                                              Brightness.light
                                              ? AppColors.black2
                                              : AppColors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        items: [
                                          //add items in the dropdown
                                          DropdownMenuItem(
                                              child: Text(
                                                "low to high",
                                                style: GoogleFonts.roboto(
                                                  color: Theme.of(context).brightness ==
                                                      Brightness.light
                                                      ? AppColors.black2
                                                      : AppColors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              value: "New York"),

                                          DropdownMenuItem(
                                            child: Text(
                                              "Tokyo",
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            value: "Tokyo",
                                          ),

                                          DropdownMenuItem(
                                            child: Text(
                                              "Moscow",
                                              style: GoogleFonts.roboto(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            value: "Moscow",
                                          )
                                        ],
                                        onChanged: (value) {
                                          //get value when changed
                                          print("You selected $value");
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                child: FutureBuilder<List<Collections>>(
                                  future: AllCollectionsService().getAllCollections(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<Collections> collections = snapshot.data!;
                                      return ListView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            // print("uuuuuuuuuuuuuuuuuuuuuuu ${collections['result']}");

                                            return ContainerSearchCollectionsGridViewWidget(collections: collections[index]);
                                          });
                                    } else {
                                      return Center(child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 60.h,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Create community marketplace',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).brightness ==
                                            Brightness.light
                                            ? Colors.black
                                            : AppColors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).brightness ==
                                            Brightness.light
                                            ? AppColors.white
                                            : AppColors.black2,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Theme.of(context).brightness ==
                                                    Brightness.light
                                                    ? AppColors.black2
                                                    : AppColors.white,
                                                width: 2),
                                            borderRadius: BorderRadius.circular(16.r))),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 298,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                            Brightness.light
                                            ? Colors.black
                                            : AppColors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(16.r))),
                                    child: Center(
                                      child: Text(
                                        'Place bid',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Theme.of(context).brightness ==
                                                Brightness.light
                                                ? AppColors.grey
                                                : Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Container(
                                    width: 60,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                            Brightness.light
                                            ? AppColors.grey
                                            : AppColors.black,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(16.r))),
                                    child: Center(
                                      child: Icon(
                                        Icons.share,
                                        color: Theme.of(context).brightness ==
                                            Brightness.light
                                            ? Colors.black
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(16.0),
                                  //   child: SizedBox(
                                  //     width: double.infinity,
                                  //     height: 60.h,
                                  //     child: ElevatedButton(
                                  //       onPressed: (){
                                  //
                                  //       },
                                  //
                                  //       child: Text(
                                  //         'Place bid',
                                  //         style: TextStyle(fontSize: 18.sp,color: AppColors.grey),
                                  //       ),
                                  //
                                  //       style: ElevatedButton.styleFrom(
                                  //           backgroundColor: AppColors.black2,
                                  //           shape: RoundedRectangleBorder(
                                  //               borderRadius: BorderRadius.circular(16.r))),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );;
                }


              }
          ),
        ),
      ),
    );
  }
}
