import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app.colors.dart';
class ContainerProfileWidget extends StatelessWidget {

  String img;
  String name;
  String num;

   ContainerProfileWidget({
    super.key,
     required this.img,
     required this.name,
     required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117.w,
      height: 117.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color:
          Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : AppColors.black,
      ),
      child: Column(
        children: [
          SizedBox(height: 21.h,),

          Image.asset(
            img,
            fit: BoxFit.cover,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(height: 10.h,),
          Text(name),
          SizedBox(height: 6.h,),
          Text(num),
        ],
      ),
    );
  }
}
