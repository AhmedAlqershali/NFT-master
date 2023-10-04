import 'dart:io';

import 'package:nft/prefs/shared_pref_controller.dart';


mixin ApiHelper {


  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader:
          SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!,
    };
  }
}
