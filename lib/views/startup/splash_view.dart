import 'package:flutter/material.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/app_cache.dart';
import 'package:flutter_template/services/locator.dart';
import 'package:flutter_template/views/home/home.dart';
import 'package:flutter_template/views/startup/landing_view.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:flutter_template/views/startup/select_profile.dart';
import '../../resources/images.dart';
import '../../services/user_services.dart';
import 'splash.dart';

Map<int, Widget> op = {
  1: const SelectProfile(),
  2: const LandingView(),
  3: const LoginView()
};

Function duringSplash = () async {
  var userService = getIt<UserServices>();
  var cache = getIt<AppData>();
  await userService.initializer();
  if (userService.isUserLoggedIn) {
    return 1;
  }
  if (cache.getBoolPreference("first_run") == null) {
    cache.setBoolPreference("first_run", false);
    return 2;
  } else {
    return 3;
  }
};

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Splash(
      imagePath: "assets/images/logo.jpg",
      backGroundColor: AppColors.white,
      // backGroundColor: Color(0xfffc6042),
      animationEffect: 'zoom-out',
      logoSize: 200,
      home: const LandingView(),
      customFunction: duringSplash,
      duration: 4500,
      type: SplashType.BackgroundProcess,
      outputAndHome: op,
    );
  }
}
