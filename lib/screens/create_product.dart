import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nft/constants/app.colors.dart';
import 'package:nft/controller/controller_model/create_products_model.dart';
import 'package:nft/controller/services/post_create_product.dart';
import 'package:nft/prefs/shared_pref_controller.dart';


class CreateProduct extends StatefulWidget {
  const CreateProduct({Key? key}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  int _counter = 0;
  String _content = 'Hi';
  String? _chosenValue;

  File? _selectedFile;
  final CreateProductsModel newProduct = CreateProductsModel();

  final CreateProductService productController = CreateProductService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.onInit();
  }
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
    GoogleFonts.roboto(color: AppColors.grey2, fontSize: 16.0.sp);
    TextStyle linkStyle =
    GoogleFonts.roboto(color: AppColors.purple, fontSize: 16.0.sp);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : AppColors.black2,
        appBar: AppBar(
          title: Text(
            'Create an Product'.tr,
            style: GoogleFonts.roboto(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : AppColors.white,
                fontSize: 14.sp),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : AppColors.black2,
          iconTheme: IconThemeData.fallback(),
          automaticallyImplyLeading: true,
          actions: [
            PopupMenuButton<String>(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : AppColors.white,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.white)),
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
        body: GetBuilder<CreateProductService>(
          init: CreateProductService(),
          builder: (controller) {
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create an Product'.tr,
                            style: GoogleFonts.roboto(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Import image, video or audio'.tr,
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'File types supported: JPGM PNG, IF, SVG, MP3, WAV, MP4, MAX size 50 MB'.tr,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp, color: AppColors.grey2),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DottedBorder(
                        color: Color(0xFFEBE7FF),
                        strokeWidth: 2,
                        dashPattern: [
                          5,
                          5,
                        ],
                        child: SizedBox(
                          height: 200.h,
                          width: 350.w,
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    setState(() {
                                      _selectedFile =
                                          File(result.files.single.path!);
                                    });
                                  } else {
                                    // User canceled the file picker
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                            'assets/images/ellipse.png')),
                                    Center(
                                        child: Image.asset(
                                            'assets/images/download.png')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller.nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: SizedBox(
                              width: 120.w,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name'.tr,
                                    style: GoogleFonts.roboto(
                                      color: Theme.of(context)
                                          .brightness ==
                                          Brightness.light
                                          ? AppColors.black
                                          : Colors.grey.shade100,
                                    ),
                                  ),
                                  Text(
                                    "*",
                                    style: GoogleFonts.roboto(
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color:
                                Theme.of(context).brightness ==
                                    Brightness.light
                                    ? AppColors.black
                                    : Colors.grey.shade100,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color:
                                Theme.of(context).brightness ==
                                    Brightness.light
                                    ? AppColors.black
                                    : Colors.grey.shade100,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color:
                                Theme.of(context).brightness ==
                                    Brightness.light
                                    ? AppColors.black
                                    : Colors.grey.shade100,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller.descriptionController,
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "Enter a description here...".tr,
                            label: SizedBox(
                              width: 120.w,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description'.tr,
                                    style: GoogleFonts.roboto(
                                        color: Theme.of(context)
                                            .brightness ==
                                            Brightness.light
                                            ? AppColors.black
                                            : Colors.grey.shade100),
                                  ),
                                  Text(
                                    "*",
                                    style: GoogleFonts.roboto(
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color:
                                Theme.of(context).brightness ==
                                    Brightness.light
                                    ? AppColors.black
                                    : Colors.grey.shade100,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color:
                                Theme.of(context).brightness ==
                                    Brightness.light
                                    ? AppColors.black
                                    : Colors.grey.shade100,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color:
                                Theme.of(context).brightness ==
                                    Brightness.light
                                    ? AppColors.black
                                    : Colors.grey.shade100,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 2.w,
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 70.h,
                        child: Container(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Network'.tr,
                              labelStyle: GoogleFonts.roboto(
                                  color: Theme.of(context).brightness ==
                                      Brightness.light
                                      ? AppColors.black
                                      : Colors.grey.shade100),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: DropdownButton<String>(
                              focusColor: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? AppColors.black
                                  : Colors.grey.shade100,
                              value: _chosenValue,
                              style: GoogleFonts.roboto(
                                  color: Theme.of(context).brightness ==
                                      Brightness.light
                                      ? AppColors.black
                                      : Colors.grey.shade100),
                              iconEnabledColor: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? AppColors.black
                                  : Colors.grey.shade100,
                              items: <String>['BSC', 'BNB']
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          value,
                                          style: GoogleFonts.roboto(
                                            color: Theme.of(context).brightness ==
                                                Brightness.light
                                                ? AppColors.black
                                                : Colors.grey.shade100,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                              hint: Center(
                                child: Text(
                                  'BNB',
                                  style: GoogleFonts.roboto(
                                      color: Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black
                                          : Colors.grey.shade100,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _chosenValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                'The network of item should be same as the collection’s. For more details, check '.tr,
                              ),
                              TextSpan(
                                  style: linkStyle, text: 'here '.tr),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Collection'.tr,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            '+ Create new collection'.tr,
                            style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              color: AppColors.purple,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEBE7FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                'Select a collection for this item. Once selected and minted, it cannot be modified. If you do not have one, please '.tr,
                              ),
                              TextSpan(
                                  style: linkStyle,
                                  text: 'create a new collection '.tr),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Properties'.tr,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () async{
            FilePickerResult? result2 =
            await FilePicker.platform.pickFiles();

            if (result2 != null) {
            setState(() {
            _selectedFile =
            File(result2.files.single.path!);
            });
            } else {
            // User canceled the file picker
            }
            },

                        child: DottedBorder(
                          color: Color(0xFFEBE7FF),
                          strokeWidth: 2,
                          dashPattern: [
                            5,
                            5,
                          ],
                          child: SizedBox(
                            height: 150.h,
                            width: 350.w,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Stack(
                                  children: [
                                    Center(
                                        child: Image.asset(
                                            'assets/images/ellipse.png')),
                                    Center(
                                        child: Icon(
                                          Icons.add,
                                          color: AppColors.purple,
                                          size: 30,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text('Fee'.tr,
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 120.w,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'estimate'.tr,
                              style: GoogleFonts.roboto(
                                  fontSize: 12.sp, color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r))),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.priceController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  label: SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      'Price'.tr,
                                      style: GoogleFonts.roboto(
                                          color: Theme.of(context)
                                              .brightness ==
                                              Brightness.light
                                              ? AppColors.black
                                              : Colors.grey.shade100),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 2.w,
                                      color:
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black
                                          : Colors.grey.shade100,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 2.w,
                                      color:
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black
                                          : Colors.grey.shade100,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 2.w,
                                      color:
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                          ? AppColors.black
                                          : Colors.grey.shade100,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      width: 2.w,
                                      color: Colors.red,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.grey,
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text('I understand and agree to the rules and\n conditions here'.tr)
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grey2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fee'.tr,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                  )),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                      controller.priceController.text,
                                      style: GoogleFonts.roboto(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                'BNB '.tr,
                                style: GoogleFonts.roboto(
                                    color: Colors.grey.shade500, fontSize: 14.sp),
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              productController.uploadProduct();
                            },
                            child: Text(
                              'Create Item'.tr,
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp, color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r)),
                                primary: AppColors.purple),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
