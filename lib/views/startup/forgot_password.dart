import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/base.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BaseView<AuthViewModel>(
          onModelReady: (model) {},
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    120.0.sbH,
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    50.0.sbH,
                    Center(
                      child: Image.asset(
                        'assets/images/lock.png',
                        fit: BoxFit.contain,
                        scale: 2,
                      ),
                    ),
                    50.0.sbH,
                    const Text(
                      'Enter your Email Address to request a\nreset link',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    50.0.sbH,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: CustomInputText(
                        controller: model.emailReset,
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
                    ),
                    100.0.sbH,
                    SizedBox(
                      width: CalcWidth(context, 320, maxWidth: 300),
                      height: CalcHeight(context, 320, maxHeight: 50),
                      child: AppButton(
                        title: "Request Link",
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (model.formKey.currentState!.validate()) {
                            model.processForgotPwd();
                          }
                          //context.push('/login', );
                        },
                      ),
                    ),
                    100.0.sbH,
                    RichText(
                      text: TextSpan(
                        text: "Never Mind, Take me back to",
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                          fontFamily: 'Poppins',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: " Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  navigationService.push(const LoginView());
                                },
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.red,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
