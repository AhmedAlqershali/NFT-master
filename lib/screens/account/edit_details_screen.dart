import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/button_widget.dart';
import 'package:nft/widget/edit_text_widget.dart';

class EditDetailsScreen extends StatefulWidget {
  const EditDetailsScreen({super.key});

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  String _content = 'Hi';
  int _counter = 0;

  late TextEditingController _userNameController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _instagramController;
  late TextEditingController _twitterController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _bioController = TextEditingController();
    _emailController = TextEditingController();
    _instagramController = TextEditingController();
    _twitterController = TextEditingController();


  }

  @override
  void dispose() {
    _userNameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _instagramController.dispose();
    _twitterController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.white
          : AppColors.black,
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
              'Edit details',
              style: GoogleFonts.roboto(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.black
                      : AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,

              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            EditTextWidget(star: '*',controller: _userNameController,name: 'UserName',size: 20,),
            EditTextWidget(star: '*',controller: _bioController,name: 'Bio',size: 20,),
            EditTextWidget(star: '*',controller: _emailController,name: 'Email',size: 20),
            EditTextWidget(star: '*',controller: _instagramController,name: 'Instagram',size: 20,),
            EditTextWidget(star: '*',controller: _twitterController,name: 'Twitter',size: 20,),
            ButtonWidget(name: 'Update profile', onPressed: (){})

          ],
        ),
      ),
    );
  }
}

