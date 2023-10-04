import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nft/controller/api_response.dart';
import 'package:nft/controller/controller_model/create_products_model.dart';
import 'package:nft/prefs/shared_pref_controller.dart';
typedef UploadImageCallback = void Function({required ApiResponse apiResponse});

class CreateProductService extends GetxController {
  File? _selectedFile;

  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceTypeController;
  late TextEditingController SubImageFileController;
  late TextEditingController ProductFileController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  String token = SharedPrefController().getValue<String>(PrefKeys.token.name)!;
  CreateProductsModel? product;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    priceTypeController = TextEditingController();
    SubImageFileController = TextEditingController();
    ProductFileController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();

  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceTypeController.dispose();
    SubImageFileController.dispose();
    ProductFileController.dispose();
    priceController.dispose();
    quantityController.dispose();

    super.dispose();
  }

  Future<void> uploadProduct() async {
    final url = Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Products/UploadProduct');
    final request = http.MultipartRequest('POST', url);

    // إضافة الملف المختار باستخدام ProductFileController
    if (_selectedFile != null) {
      final file = await http.MultipartFile.fromPath(
        'ProductFile', // اسم الملف الذي سيتم استخدامه على الخادم
        _selectedFile!.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(file);
    }
    if (_selectedFile != null) {
      final file = await http.MultipartFile.fromPath(
        'SubImageFile', // اسم الملف الذي سيتم استخدامه على الخادم
        _selectedFile!.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(file);
    }

    // إضافة باقي البيانات كنصوص
    request.fields['name'] = nameController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['priceType'] = 1.toString();
    request.fields['SubImageFile'] = 'text.png';
    request.fields['price'] = priceController.text;
    request.fields['quantity'] = 1.toString();

    request.headers['Authorization'] = '$token';

    final response = await request.send();

    if (response.statusCode == 200) {
      print('تم رفع المنتج بنجاح.');
      print(await response.stream.bytesToString());
    } else {
      print('حدث خطأ أثناء رفع المنتج. الرد: ${response.statusCode}');
    }
  }

  // هذه الدالة يمكن استخدامها لتحديث الملف المختار
  void setSelectedFile(File? file) {
    _selectedFile = file;
  }


}
