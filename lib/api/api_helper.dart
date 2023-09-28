import 'dart:io';

import 'package:nft/prefs/shared_pref_controller.dart';

import 'models/process_response.dart';


mixin ApiHelper {
  ProcessResponse get errorResponse =>
      ProcessResponse("Something went wrong, try again", false);

  ProcessResponse<T> genericErrorResponse<T>() => ProcessResponse<T>("Something went Wrong", false);

  Map<String, String> get headers {
    bool loggedIn =
        SharedPrefController().getValue<bool>(PrefKeys.loggedIn.name) ?? false;
    Map<String, String> headers = <String, String> {};
    headers[HttpHeaders.contentTypeHeader] = "application/json";
    headers[HttpHeaders.acceptHeader] = "*/*";
    if (loggedIn) {
      headers[HttpHeaders.authorizationHeader] =
          SharedPrefController().getValue<String>(PrefKeys.token.name)!;
    }
    return headers;
  }
}
