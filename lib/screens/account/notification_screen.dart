import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/card_notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _content = 'Hi';
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Colors.white)),
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

      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            NotificationWidget(name: 'New coin'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'New follow'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'New offer'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'New bid'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'Offer rejected'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'Offer accepted'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'Item sold'),
            SizedBox(height: 8.h,),
            NotificationWidget(name: 'Auction ended unsold'),


          ],
        ),
      ),
    );
  }
}
