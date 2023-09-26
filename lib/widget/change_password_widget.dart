import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft/constants/app.colors.dart';

class EditTextChangePasswordWidget extends StatefulWidget {
  String name;
  double size;
  TextEditingController controller;

  EditTextChangePasswordWidget({
    super.key,
    required this.name,
    required this.size,
    required this.controller,
  });

  @override
  State<EditTextChangePasswordWidget> createState() => _EditTextChangePasswordWidget();
}

class _EditTextChangePasswordWidget extends State<EditTextChangePasswordWidget> {
  String? _passwordError;

  String? _phoneError;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        obscureText: !_showPassword,
        expands: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: widget.size),
            errorText: _passwordError,
            label: Padding(
              padding:  EdgeInsets.only(left: 20.w),
              child: SizedBox(
                width: 150.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.black,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              icon: Icon(
                _showPassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.black,
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
                color: AppColors.red,
              ),
            )),
      ),
    );
  }
}
