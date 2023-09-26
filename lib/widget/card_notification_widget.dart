import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
class NotificationWidget extends StatefulWidget {
  String name;

   NotificationWidget({
    super.key,
    required this.name
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 366.w,
      height: 64.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white
      ),
      child: Row(
        children: [
          SizedBox(
              width: 278.w,
              height: 26,
              child: Padding(
                padding:  EdgeInsets.only(left: 21.w),
                child: Text(widget.name,style: GoogleFonts.roboto(),),
              )),
          SizedBox(
            width: 35.w,
            height: 20.h,
            child: Switch(value: isSwitched, onChanged: (bool newValue){
              setState(() {
                isSwitched = newValue;
              });

            },
              activeColor: AppColors.purple,
              focusColor: AppColors.purple,

            ),
          )
        ],
      ),
    );
  }
}
