// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/base.vm.dart';
import 'package:flutter_template/resources/events.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:flutter_template/views/agent/agent.dart';
import 'package:flutter_template/views/home/home.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:flutter_template/views/startup/reset_password.dart';
import 'package:flutter_template/views/startup/select_profile.dart';
import 'package:flutter_template/views/startup/verification.dart';
import 'package:go_router/go_router.dart';

class AuthViewModel extends BaseViewModel {
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();

  final TextEditingController otp = TextEditingController();
  final TextEditingController emailLogin = TextEditingController();
  final TextEditingController passwordLogin = TextEditingController();

  final TextEditingController vendorName = TextEditingController();
  final TextEditingController vendorAddress = TextEditingController();
  final TextEditingController vendorRegNo = TextEditingController();
  final TextEditingController vendorPhone = TextEditingController();
  final TextEditingController vendorCity = TextEditingController();
  final TextEditingController vendorState = TextEditingController();
  final TextEditingController vendorCountry = TextEditingController();
  final TextEditingController vendorEmail = TextEditingController();
  String selectedCategoryId = "";

  List<Map<String, dynamic>> businessCategories = [
    {
      "id": "9c99dffc-27f5-4ce3-a565-689fc7e161ad",
      "name": "Electrical Appliances"
    },
    {"id": "9c99dffc-2cd0-4c33-8dbc-9df4a2a0f69b", "name": "Food"},
    {"id": "9c99dffc-2fc2-4b60-bade-3e8c83c707b0", "name": "Confectioneries"},
    {"id": "9c99dffc-325b-4b8c-8df9-c581e213fee0", "name": "Building Material"},
    {"id": "9c99dffc-3516-4b40-b14e-48fe6781e91b", "name": "Household Items"}
  ];

  final emailReg =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool isHidden = false;
  bool isChecked = true;
  final formKey = GlobalKey<FormState>();
  bool termsAccepted = false;
  bool isVendor = false;

  bool isHidden2 = false;
  bool isChecked2 = true;

  final TextEditingController emailReset = TextEditingController();

  final TextEditingController otpReset = TextEditingController();
  final TextEditingController pwdReset = TextEditingController();
  final TextEditingController conFirmpwdReset = TextEditingController();

  Future processSignUp() async {
    try {
      startLoader();
      var data = {
        "email": email.text.trim(),
        "first_name": fname.text.trim(),
        "last_name": lname.text.trim(),
        "phone_number": phonenumber.text.trim(),
        "password": password.text.trim(),
        "is_retailer": isVendor,
        "vendor_name": vendorName.text.trim(),
        "vendor_address": vendorAddress.text.trim(),
        "vendor_reg_no": vendorRegNo.text.trim(),
        "vendor_phone": vendorPhone.text.trim(),
        "vendor_certificate_url": ""
      };
      print('object::$data');
      var response = await authRepo.register(data);
      if (response != null) {
        //  await userService.initializer();
        showCustomToast("Registration Successful",
            toastType: ToastType.success);
        stopLoader();
        String emailValue = email.text;
        navigationService.pushToAndRemoveUntil(VerificationView(
          email: emailValue,
        ));
      } else {
        stopLoader();
      }
    } catch (e, l) {
      stopLoader();
      print(e);
      print(l);
    }
  }

  Future processResendVerifyEmail({required String emailVal}) async {
    try {
      startLoader();
      var data = {"email": emailVal};
      var response = await authRepo.resendVerifyEmail(data);

      if (response != null) {
        //await userService.initializer();
        userService.cache.eventBus!
            .fire(ApplicationEvent("", "start_otp_timer", data: const {}));
        showCustomToast("Verification Email Sent Successfully",
            toastType: ToastType.success);
        stopLoader();
      } else {
        stopLoader();
      }
    } catch (e, l) {
      stopLoader();
      print(e);
      print(l);
    }
  }

  Future processEmailVerify({required String emailVal}) async {
    try {
      startLoader();
      var data = {
        "email": emailVal,
        "otp_code": otp.text.trim(),
      };
      print('object::$data');
      var response = await authRepo.emailVerify(data);
      userService.cache.eventBus!
          .fire(ApplicationEvent("", "stop_otp_timer", data: const {}));
      if (response != null) {
        //await userService.initializer();
        showCustomToast("Email Verified Successfully",
            toastType: ToastType.success);
        stopLoader();
        navigationService.pushAndReplace(
          LoginView(),
        );
      } else {
        stopLoader();
      }
    } catch (e, l) {
      stopLoader();
      print(e);
      print(l);
    }
  }

  Future processForgotPwd() async {
    try {
      startLoader();
      var data = {
        "email": emailReset.text.trim(),
      };
      var response = await authRepo.forgotPwd(data);
      if (response != null) {
        await userService.initializer();
        showCustomToast("A Reset OTP has been sent to your Mail",
            toastType: ToastType.success);
        stopLoader();
        String emailValues = emailReset.text;

        navigationService.pushAndReplace(
          ResetPasswordView(
            email: emailValues,
          ),
        );
      } else {
        stopLoader();
      }
    } catch (e, l) {
      stopLoader();
      print(e);
      print(l);
    }
  }

  Future processResetPwd({required String emailVals}) async {
    try {
      startLoader();
      var data = {
        "email": emailVals,
        "otp": otpReset.text.trim(),
        "new_password": pwdReset.text.trim(),
        "retype_password": conFirmpwdReset.text.trim(),
      };
      var response = await authRepo.resetPwd(data);
      if (response != null) {
        await userService.initializer();
        showCustomToast("Password Reset Successful",
            toastType: ToastType.success);
        stopLoader();
        navigationService.pushAndReplace(
          LoginView(),
        );
      } else {
        stopLoader();
      }
    } catch (e, l) {
      stopLoader();
      print(e);
      print(l);
    }
  }

  Future<void> processLogin() async {
    try {
      // Start the loader
      startLoader();

      // Prepare the login data
      var data = {
        "email": emailLogin.text.trim(),
        "password": passwordLogin.text.trim(),
      };

      // Make the login request
      var response = await authRepo.login(data);

      if (response != null) {
        // Check if the response contains an error
        if (response.statusCode != 200) {
          // Handle case where email is not verified
          if (response.data['is_email_verified'] == false) {
            stopLoader();
            navigationService.pushAndReplace(
              VerificationView(email: emailLogin.text.trim()),
            );
            return; // Exit the method to prevent further execution
          } else {
            stopLoader();
            showCustomToast("Invalid credentials or other error",
                toastType: ToastType.error);
            return;
          }
        }

        // If login is successful (statusCode == 200)
        showCustomToast("Login Successful", toastType: ToastType.success);

        // Extract user ID from the response
        final userId = response.data['user_id'];

        // Stop the loader
        stopLoader();

        // Navigate based on user ID
        if (userId == 1) {
          // Navigate to agent screen if user ID is 1
          showCustomToast("Welcome Admin!", toastType: ToastType.success);

          navigationService.pushAndReplace(AgentScreen());
        } else {
          // Navigate to the home screen
          navigationService.pushAndReplace(SelectProfile());
        }
      } else {
        // If the response is null, handle it as an error
        stopLoader();
        showCustomToast("Failed to login. Please try again.",
            toastType: ToastType.error);
      }
    } catch (e, l) {
      // Handle exceptions
      stopLoader();
      print(e);
      print(l);
    }
  }

  Future processLogout() async {
    try {
      startLoader();

      var response = await userService.logout();
      //  await userService.initializer();
      showCustomToast("Logout Successful", toastType: ToastType.success);
      stopLoader();
      navigationService.pushToAndRemoveUntil(const LoginView());
    } catch (e, l) {
      stopLoader();
      print(e);
      print(l);
    }
  }
}
