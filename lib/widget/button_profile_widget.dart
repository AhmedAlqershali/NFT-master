import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonProfileWidget extends StatelessWidget {

  final void Function() onTap;
  String name;
  Color nameColorBorder;
  Color BackgroundColor;

   ButtonProfileWidget({
    super.key,
     required this.name,
     required this.onTap,
     required this.nameColorBorder,
     required this.BackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,

      child: Container(
        height: 60.h,
        width: 145.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: BackgroundColor,
            border: Border.all(width: 2.w,color: nameColorBorder)),
        alignment: Alignment.center,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontWeight:FontWeight.w700,
              fontSize: 18.sp,
            color: nameColorBorder,

          ),
        ),
      ),
    );
  }
}
