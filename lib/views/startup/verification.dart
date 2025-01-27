import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/data/https.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/resources/events.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/base.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class VerificationView extends StatefulWidget {
  final String email;
  const VerificationView({
    super.key,
    required this.email,
  });

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  late String eMail;
  var timeleft = 120;
  bool isVerifying = false;
  String otpText = "Didn't Get OTP, Send Again";
  late Timer timer;

  /* @override
  void initState() {
    super.initState();
    
  } */

  startTimer(AuthViewModel model) {
    int start = 30000;
    setState(() {
      timeleft = (start / 1000).round();
      isVerifying = true;
      otpText = "Resend OTP in $timeleft";
    });
    const oneDecimal = Duration(milliseconds: 1000);
    setState(() {
      timer = Timer.periodic(
          oneDecimal,
          (Timer timer) => setState(() {
                if (start < 1000) {
                  timer.cancel();
                  isVerifying = false;
                  otpText = "Didn't Get OTP, Send Again";
                } else {
                  start = start - 1000;
                  //print(_start);
                  timeleft = timeleft - 1;
                  otpText = "Resend OTP in $timeleft";
                }
              }));
    });
  }

  stopTimer(AuthViewModel model) {
    isVerifying = false;
    if (timer.isActive) {
      timer.cancel();
    }
    otpText = "Didn't Get OTP, Send Again";
    model.notifyListeners();
  }

  listenForEvent(
      AuthViewModel model, ApplicationEvent event, BuildContext context) {
    if (event.type == 'start_otp_timer') {
      startTimer(model);
    }
    if (event.type == 'stop_otp_timer') {
      stopTimer(model);
    }
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(onModelReady: (model) {
      eMail = widget.email;
      Timer(const Duration(milliseconds: 1500), () {
        userServices.cache.eventBus!
            .fire(const ApplicationEvent("", "start_otp_timer", data: {}));
      });
    }, onListenForEvent: (model, event) {
      listenForEvent(model, event, context);
    }, builder: (context, model, child) {
      return Scaffold(
          appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 52,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Form(
              key: model.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.0.sbH,
                  Center(
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      scale: 2,
                    ),
                  ),
                  20.0.sbH,
                  const Text(
                    'Verification Pass',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  20.0.sbH,
                  const Text(
                    'A 6-digit Verification Code has been sent your\nEmail Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  30.0.sbH,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: CustomInputText(
                      controller: model.otp,
                      inputType: TextInputType.number,
                      prefix: const Icon(
                        Iconsax.lock,
                        color: AppColors.darkBlue,
                        size: 20,
                        weight: 20,
                      ),
                      hintText: 'Enter OTP',
                      validator: (val) {
                        if (val!.length != 6) {
                          return "Enter 6-digit OTP";
                        }
                        return null;
                      },
                    ),
                  ),
                  15.0.sbH,
                  TextButton(
                    child: AutoSizeText(
                      otpText,
                      style: const TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (!isVerifying) {
                        model.processResendVerifyEmail(emailVal: eMail);
                      }
                    },
                  ),
                  70.0.sbH,
                  SizedBox(
                    width: CalcWidth(context, 320, maxWidth: 300),
                    height: CalcHeight(context, 320, maxHeight: 50),
                    child: AppButton(
                      title: "Authenticate My Account",
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (model.formKey.currentState!.validate()) {
                          model.processEmailVerify(emailVal: eMail);
                        }
                        //  context.push('/login', );
                      },
                    ),
                  ),
                  15.0.sbH,
                  TextButton(
                    child: const AutoSizeText(
                      "Another User? Login Here!",
                      style: TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      navigationService.pushAndReplace(const LoginView());
                    },
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
