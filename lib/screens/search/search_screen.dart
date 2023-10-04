import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/card_search_collections_gridview_widget.dart';
import 'package:nft/widget/card_search_collections_listview_widget.dart';
import 'package:nft/widget/card_search_trending_gridview_widget.dart';
import 'package:nft/widget/card_search_trending_listview_widget.dart';
import 'package:nft/widget/card_search_users_widget.dart';

import '../../controller/controller_model/collections.dart';
import '../../controller/controller_model/create_products_model.dart';
import '../../controller/controller_model/users_model.dart';
import '../../controller/services/get_all_collections.dart';
import '../../controller/services/get_all_products.dart';
import '../../controller/services/get_all_users.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : AppColors.black2,
            toolbarHeight: 120.h,
            // Set this height
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? AppColors.grey
                                  : AppColors.black,
                            ),
                            height: 56.h,
                            width: 56.w,
                            child: Image.asset(
                              'assets/icon/filter.png',
                              width: 22.w,
                              height: 18.h,
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? AppColors.black
                                  : AppColors.white,
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 56.h,
                          width: 254.w,
                          // Add padding around the search bar
                          // Use a Material design search bar
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...'.tr,
                              // Add a clear button to the search bar
                              suffixIcon: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.search,
                                  color: Theme.of(context).brightness ==
                                      Brightness.light
                                      ? Colors.black
                                      : AppColors.white,
                                ),
                              ),
                              // Add a search icon or button to the search bar
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isCheck = !isCheck;
                              });
                            },
                            icon: isCheck == false
                                ? Image.asset(
                              'assets/icon/listview.png',
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? Colors.black
                                  : AppColors.white,
                            )
                                : Image.asset(
                              'assets/icon/grid.png',
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? Colors.black
                                  : AppColors.white,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(bottom: 60.0.h),
                child: PopupMenuButton<String>(
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
                ),
              )
            ],
            bottom: TabBar(
              indicatorColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black
                  : AppColors.white,
              indicatorWeight: 3.w,
              tabs: [
                RepeatedTab(lable: 'Trending'.tr),
                RepeatedTab(lable: 'Collections'.tr),
                RepeatedTab(lable: 'Users'.tr),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              isCheck == false
                  ? FutureBuilder<List<CreateProductsModel>>(
                  future: AllProductsService().getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CreateProductsModel> products = snapshot.data!;
                      return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (178.w / 274.h),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ContainerSearchTrendingGridViewWidget(
                            productsModel: products[index],
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
                  : FutureBuilder<List<CreateProductsModel>>(
                  future: AllProductsService().getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CreateProductsModel> products = snapshot.data!;
                      return ListView.separated(
                        itemBuilder: (context, index) =>
                            ContainerSearchTrendingListViewWidget(
                              productsModel: products[index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5.h,
                        ),
                        itemCount: snapshot.data!.length,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              isCheck == false
                  ? FutureBuilder<List<Collections>>(
                  future: AllCollectionsService().getAllCollections(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Collections> collections = snapshot.data!;
                      return ListView.separated(
                        itemBuilder: (context, index) =>
                            ContainerSearchCollectionsGridViewWidget(
                                collections: collections[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5.h,
                        ),
                        itemCount: snapshot.data!.length,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
                  : FutureBuilder<List<Collections>>(
                  future: AllCollectionsService().getAllCollections(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Collections> collections = snapshot.data!;
                      return  ListView.separated(itemBuilder: (context, index) => ContainerSearchCollectionsListViewWidget(collections: collections[index]),
                        separatorBuilder: (context, index) => SizedBox(height: 5.h,),itemCount: snapshot.data!.length,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),

              FutureBuilder<List<UsersModel>>(
                  future: AllUsersService().getAllUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<UsersModel> users = snapshot.data!;
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ContainerSearchUsersWidget(
                              num: (index + 1).toString(),users: users[index],);
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),


            ],
          ),
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  String lable;

  RepeatedTab({Key? key, required this.lable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        lable,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
