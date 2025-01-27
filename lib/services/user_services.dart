import 'package:flutter/material.dart';
import 'package:flutter_template/config/urlPath.dart';
import 'package:flutter_template/data/https.dart';
import 'package:flutter_template/services/model/user_model.dart';

import 'app_cache.dart';
import 'locator.dart';

class UserServices extends ChangeNotifier {
  AppData cache = getIt<AppData>();
  bool isUserLoggedIn = false;
  bool firstLogin = false;
  String authToken = "";
  //UserRepository userRepo = getIt<UserRepository>();
  Future initializer() async {
    isUserLoggedIn = false;
    firstLogin = true;
    authToken = "";
    String? userToken = cache.getStringPreference('token');
    //cache.lgas = await userRepo.getLGAs();
    //cache.states = await userRepo.getStates();
    // int? userId = cache.getIntPreference('id');

    if (userToken != null) {
      authToken = userToken;
      cache.user = await getUserDetail();
      if (cache.user != null) {
        isUserLoggedIn = true;
      }
    }
    firstLogin = false;
  }

  Future<bool> logout() async {
    isUserLoggedIn = false;
    return await cache.clearPreference();
  }

  Future<UserData?> getUserDetail() async {
    String? token = cache.getStringPreference('token');
    String? id = cache.getStringPreference('id');

    try {
      // var response = await dio.get(UrlPath.profile);
      var response = await httpGet('${UrlPath.profile}$id/',
          hasAuth: true, token: token ?? "");
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");
      if (response.statusCode == 200) {
        notifyListeners();

        return UserData.fromJson(response.data['data']);
      }
    } catch (e, t) {
      print(e);
      print(t);
      //throw Exception('An unknown error occurred: ${e.toString()}');
    }
    return null;
  }
}
