import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft/constants/app.colors.dart';

class ButtonWidget extends StatelessWidget {
  String name;
  final void Function() onPressed;

  ButtonWidget({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 60.h,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            name,
            style: TextStyle(fontSize: 18.sp,color: Theme.of(context).brightness == Brightness.light
                ? AppColors.white
                : AppColors.black,
            fontWeight: FontWeight.bold
            ),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor:Theme.of(context).brightness == Brightness.light
                  ? AppColors.black
                  : AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r))),
        ),
      ),
    );
  }
}
