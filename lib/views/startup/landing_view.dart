import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/startup/create_account.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:go_router/go_router.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: 66.h),
          Image.asset(
            'assets/images/welcome.png',
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 30.h,
          ),
          const Text(
            'Create Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          45.0.sbH,
          SizedBox(
            width: CalcWidth(context, 320, maxWidth: 300),
            height: CalcHeight(context, 320, maxHeight: 50),
            child: AppButton(
              title: "Create Account",
              onPressed: () {
                navigationService.pushAndReplace(const CreateAccountView());
              },
            ),
          ),
          85.0.sbH,
          SizedBox(
            width: CalcWidth(context, 320, maxWidth: 300),
            height: CalcHeight(context, 320, maxHeight: 50),
            child: AppButton(
              buttonTextColor: AppColors.darkBlue,
              buttonBgColor: AppColors.white,
              buttonType: ButtonType.outline,
              fontSize: 14,
              title: "Not New Here? Login",
              onPressed: () {
                navigationService.pushAndReplace(
                  const LoginView(),
                );
              },
            ),
          ),
          25.0.sbH,
        ],
      ),
    );
  }
}
