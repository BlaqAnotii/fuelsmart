import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/home/book_CNG.dart';
import 'package:flutter_template/views/home/home.dart';

class SelectProfile extends StatefulWidget {
  const SelectProfile({super.key});

  @override
  State<SelectProfile> createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        child: Form(
          // key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250.h,
              ),
              Image.asset(
                "assets/images/logo.jpg",
                scale: 2,
              ),
              SizedBox(
                height: 200.h,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                clipBehavior: Clip.none,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    30.0.sbH,
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,
                      ),
                      child: const Text(
                        "Select Options: Want to shop for CNG Components? or Convert your Vehicle to use CNG",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
                      ),
                    ),
                    50.0.sbH,
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,
                      ),
                      child: AppButton(
                        title: 'Shop CNG Component',
                        onPressed: () {
                          // FocusManager.instance.primaryFocus?.unfocus();
                          // if (model.formKey.currentState!.validate()) {
                          //   model.attemptLogin();
                          // }
                          navigationService.push(const HomeScreen());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,
                      ),
                      child: AppButton(
                        title: 'Convert your Vehicle',
                        onPressed: () {
                          // FocusManager.instance.primaryFocus?.unfocus();
                          // if (model.formKey.currentState!.validate()) {
                          //   model.attemptLogin();
                          // }
                          navigationService
                              .push(const BookCNGScreen());
                        },
                      ),
                    ),
                    30.0.sbH,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
