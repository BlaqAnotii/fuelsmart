import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/base.dart';
import 'package:flutter_template/views/home/home.dart';
import 'package:flutter_template/views/startup/create_account.dart';
import 'package:flutter_template/views/startup/forgot_password.dart';
import 'package:flutter_template/views/startup/select_profile.dart';
import 'package:iconsax/iconsax.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) {
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                ),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.emailLogin,
                        inputType: TextInputType.emailAddress,
                        hintText: 'Enter Email',
                        prefix: const Icon(
                          Icons.mail_outlined,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          String validate = val!.replaceAll(RegExp(r"\s+"), "");
                          if (validate.isEmpty ||
                              !RegExp(model.emailReg).hasMatch(validate)) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.passwordLogin,
                        inputType: TextInputType.text,
                        obscure: model.isHidden,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              model.isHidden = !model.isHidden;
                            });
                          },
                          icon: Icon(
                            model.isHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            weight: 20,
                          ),
                        ),
                        prefix: const Icon(
                          Iconsax.lock,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        hintText: 'Enter Password',
                        validator: (val) {
                          if (val!.length < 8) {
                            return "Enter a password of more than 8 characters";
                          }
                          return null;
                        },
                      ),
                      70.0.sbH,
                      AppButton(
                        title: "Login",
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (model.formKey.currentState!.validate()) {
                            model.processLogin();
                          }
                        },
                      ),
                      120.0.sbH,
                      AppButton(
                        buttonTextColor: AppColors.darkBlue,
                        buttonBgColor: AppColors.white,
                        buttonType: ButtonType.outline,
                        fontSize: 15,
                        title: "Don't have an Account? Sign Up",
                        onPressed: () {
                          navigationService.push(
                            const CreateAccountView(),
                          );
                        },
                      ),
                      15.0.sbH,
                      AppButton(
                        buttonTextColor: AppColors.darkBlue,
                        buttonBgColor: AppColors.white,
                        buttonType: ButtonType.outline,
                        fontSize: 15,
                        title: "Forgot your password?",
                        onPressed: () {
                          navigationService.push(const ForgotPasswordView());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
