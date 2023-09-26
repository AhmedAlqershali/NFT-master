import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:nft/widget/button_profile_widget.dart';

class CheckoutScreen3 extends StatefulWidget {
  const CheckoutScreen3({super.key});

  @override
  State<CheckoutScreen3> createState() => _CheckoutScreen3State();
}

class _CheckoutScreen3State extends State<CheckoutScreen3> {
  int _counter = 0;
  String _content = 'Hi';
  bool _check = false;
  String selectedOption = 'Option 1';

  late TextEditingController _creditCard;

  @override
  void initState() {
    super.initState();
    _creditCard = TextEditingController();

  }

  @override
  void dispose() {
    _creditCard.dispose();
    super.dispose();
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
                '3. Choose a payment method',
                style: GoogleFonts.roboto(
                    fontSize: 26.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile(
              title: Text('Credit Card'),
              value: 'Option 1',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 16.w),
              child: TextField(
                controller: _creditCard,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.credit_card_outlined),
                    // contentPadding: EdgeInsets.symmetric(vertical: size),
                    label: Padding(
                      padding:  EdgeInsets.only(left: 20.w),
                      child: SizedBox(
                        width: 130.w,
                        child: Text('Credit Card',style: GoogleFonts.roboto(
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
            SizedBox(height: 24.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 16.w,),
                SizedBox(
                  height: 56.h,
                  width: 159.w,
                  child: Expanded(
                    child: TextField(
                      controller: _creditCard,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Padding(
                            padding:  EdgeInsets.only(left: 20.w),
                            child: SizedBox(
                              width: 130.w,
                              child: Text('MM/YY',style: GoogleFonts.roboto(
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
                ),
                SizedBox(width: 16.w,),
                SizedBox(
                  height: 56.h,
                  width: 159.w,
                  child: Expanded(
                    child: TextField(
                      controller: _creditCard,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Padding(
                            padding:  EdgeInsets.only(left: 20.w),
                            child: SizedBox(
                              width: 130.w,
                              child: Text('CVC',style: GoogleFonts.roboto(
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
                ),
                SizedBox(width: 16.w,),

              ],
            ),
            RadioListTile(
              title: Text('Moyasar'),
              value: 'Option 2',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Padding(
              padding:  EdgeInsets.only(left: 24.w,bottom: 24.h),
              child: Text('Summary',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp
              ),),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp
                      )),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            fit: BoxFit.contain,
                            height: 18.h,
                            width: 18.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text('0.49 BNB',style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp
                          )),
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery',style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp
                      )),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            fit: BoxFit.contain,
                            height: 18.h,
                            width: 18.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text('0.49 BNB',style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp
                          )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('VAT',style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp
                          )),
                          Text('(Czech Republic)'),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            fit: BoxFit.contain,
                            height: 18.h,
                            width: 18.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text('0.49 BNB',style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp
                          )),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discounted price',style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp
                  )),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/coin.png',
                        fit: BoxFit.contain,
                        height: 18.h,
                        width: 18.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text('0.49 BNB',style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp
                      )),
                    ],
                  )

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ButtonProfileWidget(name: 'Pay Now', onTap:(){}, nameColorBorder: Colors.white, BackgroundColor: AppColors.black2)
                ],
              ),
            )






          ],
        ),
      ),

    );
  }
}
