import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/base.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordView extends StatefulWidget {
  final String email;

  const ResetPasswordView({super.key, required this.email});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late String eMail;
  @override
  void initState() {
    super.initState();
    eMail = widget.email;
  }

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
                      'New Password',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    20.0.sbH,
                    const Text(
                      'Enter 6 digit Reset OTP and New Password',
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
                        controller: model.otpReset,
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
                    30.0.sbH,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: CustomInputText(
                        controller: model.pwdReset,
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
                    ),
                    30.0.sbH,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: CustomInputText(
                        controller: model.conFirmpwdReset,
                        inputType: TextInputType.text,
                        obscure: model.isHidden2,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              model.isHidden2 = !model.isHidden2;
                            });
                          },
                          icon: Icon(
                            model.isHidden2
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        prefix: const Icon(
                          Iconsax.lock,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        hintText: 'Re Enter Password',
                        validator: (val) {
                          if (val!.length < 8) {
                            return "Enter a password of more than 8 characters";
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
                        title: "Authenticate My Account",
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (model.formKey.currentState!.validate()) {
                            model.processResetPwd(emailVals: eMail);
                          }
                        },
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
