import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/button_widget.dart';

class PaymentSettingsScreen extends StatefulWidget {
  const PaymentSettingsScreen({super.key});

  @override
  State<PaymentSettingsScreen> createState() => _PaymentSettingsScreenState();
}

class _PaymentSettingsScreenState extends State<PaymentSettingsScreen> {
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
              'Edit details',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                // controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.credit_card_outlined),

                    label: Padding(
                      padding:  EdgeInsets.only(left: 20.w),
                      child: SizedBox(
                        width: 90.w,
                        child:Text('Credit card',style: GoogleFonts.roboto(
                        color: Colors.black,

                            ),),

                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        width: 2.w,
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
            ),
Row(
  children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          // controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'MM/YY',
              labelText: 'Credit card',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  width: 2.w,
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
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          // controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'CVC',
              labelText: 'Security code',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  width: 2.w,
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
      ),
    ),
  ],
),


             ButtonWidget(name: 'Update payment card', onPressed: (){})

          ],
        ),
      ),
    );
  }
}
