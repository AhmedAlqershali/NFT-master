import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app.colors.dart';
class IconButtonWidget extends StatelessWidget {
  String name;
  String img;
  final void Function() onPressed;
  IconButtonWidget({
    super.key,
    required this.name,
    required this.img,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 179.w,
        height: 60.h,
        decoration: BoxDecoration(
            color:
            Theme.of(context).brightness == Brightness.light
            ? Color(0xFfEBEDF2)
            : AppColors.black3,
            borderRadius: BorderRadius.circular(16.r)
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img,width: 23.44.w,height: 23.29.h,),
            SizedBox(width:10.w ,),
            Text(name,style: TextStyle(
                fontSize:18.sp,
                fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }
}
