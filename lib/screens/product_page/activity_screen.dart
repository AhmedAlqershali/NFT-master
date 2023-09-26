import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/card_activity_widget.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _counter = 0;
  String _content = 'Hi';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
              child: Text(
            'Activity',
            style: GoogleFonts.roboto(color: Colors.black),
          ),
          ),
          actions: [
            PopupMenuButton<String>(
              color: Colors.black,
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
          leading: Image.asset('assets/icon/back.png'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Activity',
                style: GoogleFonts.roboto(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return ContainerActivityWidget(img: 'assets/images/img_profile.png', name: 'anas', num: '55');
                  }),
            ),
          ],
        ),

      ),
    );
  }
}
