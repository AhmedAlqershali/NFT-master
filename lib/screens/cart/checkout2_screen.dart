import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/button_profile_widget.dart';
import 'package:nft/widget/edit_text_widget.dart';

class CheckoutScreen2 extends StatefulWidget {
  const CheckoutScreen2({super.key});

  @override
  State<CheckoutScreen2> createState() => _CheckoutScreen2State();
}

class _CheckoutScreen2State extends State<CheckoutScreen2> {
  int _counter = 0;
  String _content = 'Hi';
  String selectedValue = 'جدة';

  String selectedOption = 'Option 1';


  late TextEditingController _locationrController;

  @override
  void initState() {
    super.initState();
    _locationrController = TextEditingController();



  }

  @override
  void dispose() {
    _locationrController.dispose();
    super.dispose();
  }

  int _customCounter = 1;
  void _incrementCustomStepper() {
    setState(() {
      if (_customCounter < 3) {
        _customCounter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.roboto(color: Colors.black, fontSize: 14.sp),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData.fallback(),
        automaticallyImplyLeading: true,
        actions: [
          PopupMenuButton<String>(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.white)),
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
                  child: Text(
                    'Hi',
                    style: GoogleFonts.roboto(),
                  ),
                  value: 'Hi',
                  textStyle: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  child: const Text('hello'),
                  value: 'hello',
                  textStyle: GoogleFonts.roboto(
                    color: Colors.black,
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  child: const Text('hello hi'),
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
      body: Container(
        color:Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : AppColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 20.w, bottom: 5.h),
              child: Text(
                '1.Add your personal info',
                style: GoogleFonts.roboto(
                    fontSize: 26.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            customRadioTile(
              'Fedex',
              'Option 1',
              14.00,
              selectedOption,
                  (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            SizedBox(height: 10.h,),
            customRadioTile(
              'DHL Worldwide',
              'Option 2',
              14.00,
              selectedOption,
                  (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            SizedBox(height: 10.h,),
            customRadioTile(
              'Fedex Express',
              'Option 3',
              14.00,
              selectedOption,
                  (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,

              ),
              child: Column(
                children: [
                  RadioListTile(
                    title: Text('Inpost - Parcel locker'),
                    value: 'Option 4',
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                      },
                    secondary:Text('+\$4.00') ,
                  ),
                  EditTextWidget(star: '*',controller: _locationrController,name: 'Location',size: 20,),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Totla:',style: GoogleFonts.roboto(
                          color: AppColors.black2,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400
                      ),),
                      SizedBox(height: 8.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Image.asset('assets/images/coin.png',width: 24.w,height: 24.h,),
                          SizedBox(width: 4.w,),
                          Text('24.55 BNB',style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500
                          ),)
                        ],)
                    ],
                  ),
                  ButtonProfileWidget(name: 'Next', onTap:_incrementCustomStepper, nameColorBorder: Colors.white, BackgroundColor: AppColors.black2)
                ],
              ),
            )



          ],
        ),
      ),

    );
  }
  Widget customRadioTile(String titleText,String value,double num, String groupValue, Function(String) onChanged) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              title: Text(titleText),
              value: value,
              groupValue: groupValue,
              onChanged: (value) {
                onChanged(value!);
              },
              secondary:Text(num.toString()) ,
            ),
          ),
        ],
      ),
    );
  }

}
