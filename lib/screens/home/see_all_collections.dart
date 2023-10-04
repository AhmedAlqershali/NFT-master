import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nft/widget/card_search_collections_listview_widget.dart';

import '../../constants/app.colors.dart';
import '../../controller/controller_model/collections.dart';
import '../../controller/services/get_all_collections.dart';


class SeeAllCollectionsScreen extends StatefulWidget {
  const SeeAllCollectionsScreen({super.key});

  @override
  State<SeeAllCollectionsScreen> createState() => _SeeAllCollectionsScreenState();
}

class _SeeAllCollectionsScreenState extends State<SeeAllCollectionsScreen> {
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
        title: Text('Collections',style: GoogleFonts.roboto(
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
      body: FutureBuilder<List<Collections>>(
          future: AllCollectionsService().getAllCollections(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Collections> collections = snapshot.data!;

              return  ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.h,
                  ),
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ContainerSearchCollectionsListViewWidget(collections: collections[index]);
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          }

      ),
    );
  }
}
