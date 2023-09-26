import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/button_widget.dart';
import 'package:nft/widget/change_password_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;


  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();



  }



  String _content = 'Hi';
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Settings',style: GoogleFonts.roboto(
          color: Colors.black,
        ),),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
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
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Change Password',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            EditTextChangePasswordWidget(name: 'Current password', size: 20, controller: _currentPasswordController,),
            EditTextChangePasswordWidget(name: 'new password', size: 20, controller: _newPasswordController,),
            EditTextChangePasswordWidget(name: 'Confirm password', size: 20, controller: _confirmPasswordController,),
            ButtonWidget(name: 'Update password', onPressed: (){})

          ],
        ),
      ),
    );
  }
}
