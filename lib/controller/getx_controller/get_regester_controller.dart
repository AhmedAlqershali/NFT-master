// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:nft/controller/auth_controller/auth_regester_controller.dart';
// import 'package:nft/core/helpers/request_state.dart';
// import 'package:nft/models/regester_model.dart';
// import 'package:nft/models/user_model.dart';
// import 'package:nft/utils/context_extension.dart';
//
// class GetRegesterController extends GetxController {
//   late TextEditingController phoneNumberController;
//   late TextEditingController passwordController;
//
//   @override
//   void onInit() {
//     super.onInit();
//     passwordController = TextEditingController();
//     phoneNumberController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     phoneNumberController.dispose();
//     super.dispose();
//   }
//
//   RegesterModel register = RegesterModel.empty();
//   String registerMessage = "";
//   RequestState requestState = RequestState.initial;
//
//   void copyWith({RegesterModel? register,
//     String? registerMessage,
//     RequestState? requestState}) {
//     this.register = register ?? this.register;
//     this.registerMessage = registerMessage ?? this.registerMessage;
//     this.requestState = requestState ?? this.requestState;
//     update();
//   }
//
//   Future<void> registerMethod(BuildContext context) async {
//     copyWith(requestState: RequestState.loading);
//     print(phoneNumberController.text);
//     print(passwordController.text);
//    await AuthRegesterController.register(
//       phoneNumber: phoneNumberController.text,
//       password: passwordController.text,).then((value) {
//      print('=======');
//      print(phoneNumberController.text);
//      print(passwordController.text);
//       if (value.status) {
//         copyWith(
//             register: value,
//             requestState: RequestState.done,
//             registerMessage: "تمت العملية بنجاح");
//         context.showSnackBar(message: "تمت العملية بنجاح", erorr: false);
//       }
//       else {
//         copyWith(
//           register: value,
//           requestState: RequestState.error,
//           registerMessage: value.message,
//         );
//         context.showSnackBar(message: value.message,erorr: true);
//       }
//     }).catchError((error) {
//       print(error);
//       context.showSnackBar(message: "Something wrong",erorr: true);
//
//       copyWith(
//       requestState: RequestState.error,
//       registerMessage: "Something wrong $error");
//       });
//   }
// }

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class GetRegesterController extends GetxController{
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }



  Future<void> registerUser() async {
    final url = Uri.parse('https://storesuadia-001-site1.etempurl.com/api/Users/Register');

    final Map<String, String> requestData = {
      'phoneNumber': phoneNumberController.text,
      'password': passwordController.text,
      // 'phoneNumber': "972597668446",
      // 'password': "A12312##",
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      // تم التسجيل بنجاح
      print("تم التسجيل بنجاح");
      print(response.body);
    } else {
      // حدث خطأ أثناء التسجيل
      print("حدث خطأ أثناء التسجيل");
      print(response.body);
    }
  }

}

