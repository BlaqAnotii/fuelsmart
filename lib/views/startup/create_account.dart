import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/base.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({
    super.key,
  });

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
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
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.w,
                  right: 25.w,
                ),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      const AutoSizeText(
                        'Create My Fuelsmart Account',
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.fname,
                        inputType: TextInputType.name,
                        hintText: 'Enter First Name',
                        prefix: const Icon(
                          Iconsax.user,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter your First name';
                          }

                          return null;
                        },
                      ),
                      20.0.sbH,
                      CustomInputText(
                        controller: model.lname,
                        inputType: TextInputType.name,
                        hintText: 'Enter Last Name',
                        prefix: const Icon(
                          Iconsax.user,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter your Last name';
                          }

                          return null;
                        },
                      ),
                      20.0.sbH,
                      CustomInputText(
                        controller: model.phonenumber,
                        inputType: TextInputType.phone,
                        hintText: 'Enter Phone Number',
                        prefix: const Icon(
                          Iconsax.call,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.length < 10) {
                            return "Enter a valid phone number";
                          } else if (val.isEmpty) {
                            return "Phone number can't be empty";
                          }
                          return null;
                        },
                      ),
                      20.0.sbH,
                      CustomInputText(
                        controller: model.email,
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
                      20.0.sbH,
                      CustomInputText(
                        controller: model.password,
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
                      20.0.sbH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Register as Vendor",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              activeColor: AppColors.blue,
                              value: model.isVendor,
                              onChanged: (value) {
                                setState(() {
                                  model.isVendor = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      if (model.isVendor == true) ...[
                        20.0.sbH,
                        CustomInputText(
                          controller: model.vendorName,
                          inputType: TextInputType.name,
                          hintText: 'Enter Business Name',
                          prefix: const Icon(
                            Iconsax.building,
                            color: AppColors.darkBlue,
                            size: 20,
                            weight: 20,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Business Name is Required';
                            }

                            return null;
                          },
                        ),
                        20.0.sbH,
                        CustomInputText(
                          controller: model.vendorAddress,
                          inputType: TextInputType.streetAddress,
                          hintText: 'Enter Business Address',
                          prefix: const Icon(
                            Iconsax.location,
                            color: AppColors.darkBlue,
                            size: 20,
                            weight: 20,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Business Address is Required';
                            }

                            return null;
                          },
                        ),
                        20.0.sbH,
                        CustomInputText(
                          controller: model.vendorRegNo,
                          inputType: TextInputType.text,
                          hintText:
                              'Enter Reg. number(Optional, If Registered)',
                          prefix: const Icon(
                            Iconsax.document,
                            color: AppColors.darkBlue,
                            size: 20,
                            weight: 20,
                          ),
                        ),
                        20.0.sbH,
                        CustomInputText(
                          controller: model.vendorPhone,
                          inputType: TextInputType.phone,
                          hintText: 'Enter Business Phone Number',
                          prefix: const Icon(
                            Iconsax.call,
                            color: AppColors.darkBlue,
                            size: 20,
                            weight: 20,
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Business Phone Number is Required';
                            }

                            return null;
                          },
                        ),
                      ],
                      20.0.sbH,
                      Row(
                        children: [
                          Transform.scale(
                            scale: 0.85,
                            child: Checkbox(
                              side: const BorderSide(
                                color: AppColors.darkBlue,
                              ),
                              activeColor: AppColors.darkBlue,
                              focusColor: AppColors.darkBlue,
                              checkColor: AppColors.darkBlue,
                              value: model.termsAccepted,
                              onChanged: (bool? value) {
                                setState(() {
                                  model.termsAccepted = value ?? false;
                                });
                              },
                            ),
                          ),
                          const Expanded(
                            child: AutoSizeText(
                              'I agree to all Terms and Conditions attached',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      40.0.sbH,
                      AppButton(
                        title: "Create Account",
                        fontSize: 15,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (model.formKey.currentState!.validate()) {
                            if (model.termsAccepted == false) {
                              showCustomToast("Please Accept of use",
                                  toastType: ToastType.error);
                              return;
                            }
                            model.processSignUp();
                          }
                          //navigationService.pushAndReplace(const LoginView());
                        },
                      ),
                      20.0.sbH,
                      AppButton(
                        buttonTextColor: AppColors.darkBlue,
                        buttonBgColor: AppColors.white,
                        buttonType: ButtonType.outline,
                        fontSize: 14,
                        title: "Not New Here? Login",
                        onPressed: () {
                          navigationService.pushAndReplace(const LoginView());
                        },
                      ),
                      20.0.sbH,
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
