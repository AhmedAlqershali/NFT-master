import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';

class EditTextWidget extends StatelessWidget {
  String name;
  String star;
  double size;
  TextEditingController controller;

   EditTextWidget({
    super.key,
     required this.name,
     required this.star,
     required this.size,
     required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: size),
            label: Padding(
              padding:  EdgeInsets.only(left: 20.w,right: 20.w),
              child: SizedBox(
                width: 130.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: GoogleFonts.roboto(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black
                    : AppColors.white,
                ),),
                    Text(
                      star,
                      style: TextStyle(color:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColors.black
                          : AppColors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black
                    : AppColors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black
                    : AppColors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.black,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color:Theme.of(context).brightness == Brightness.light
                    ? AppColors.black
                    : AppColors.white,
              ),
            )),
      ),
    );
  }
}
