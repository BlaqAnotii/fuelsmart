// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/home/booked_cng.dart';
import 'package:flutter_template/views/startup/landing_view.dart';
import 'package:iconsax/iconsax.dart';

class BookCNGScreen extends StatefulWidget {
  const BookCNGScreen({super.key});

  @override
  State<BookCNGScreen> createState() => _BookCNGScreenState();
}

class _BookCNGScreenState extends State<BookCNGScreen> {
  String _selectedCurrency = 'V4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 50,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            navigationService.goBack();
          },
          child: const Icon(Iconsax.arrow_circle_left,
              color: AppColors.darkBlue, size: 25),
        ),
        centerTitle: false,
        title: const Text(
          "Book For CNG Conversion",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter"),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          // key: model.formKey,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.0.sbH,
                const Text(
                  "Enter the following details to book your vehicle for CNG Conversion",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"),
                ),
                20.0.sbH,
                const CustomInputText(
                  //controller: model.vendorName,
                  inputType: TextInputType.name,
                  hintText: 'Enter Car Name',
                  prefix: Icon(
                    Iconsax.car,
                    color: AppColors.darkBlue,
                    size: 20,
                    weight: 20,
                  ),
                  // validator: (val) {
                  //   if (val!.isEmpty) {
                  //     return 'Business Name is Required';
                  //   }

                  //   return null;
                  // },
                ),
                20.0.sbH,
                const CustomInputText(
                  // controller: model.vendorAddress,
                  inputType: TextInputType.name,
                  hintText: 'Enter Car Model',
                  prefix: Icon(
                    Iconsax.car,
                    color: AppColors.darkBlue,
                    size: 20,
                    weight: 20,
                  ),
                  // validator: (val) {
                  //   if (val!.isEmpty) {
                  //     return 'Business Address is Required';
                  //   }

                  //   return null;
                  // },
                ),
                20.0.sbH,
                const CustomInputText(
                  //  controller: model.vendorRegNo,
                  inputType: TextInputType.text,
                  hintText: 'Enter Car Year',
                  prefix: Icon(
                    Iconsax.calendar,
                    color: AppColors.darkBlue,
                    size: 20,
                    weight: 20,
                  ),
                ),
                20.0.sbH,
                const Text(
                  "Select Engine type",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"),
                ),
                10.0.sbH,
                DropdownButtonFormField<String>(
                  value: _selectedCurrency,
                  items: ['V4', 'V6', 'V8', 'V12'].map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCurrency = value!;
                    });
                  },
                ),
                20.0.sbH,
                const CustomInputText(
                  // controller: model.vendorPhone,
                  inputType: TextInputType.text,
                  hintText: 'Enter Appointment Date',
                  prefix: Icon(
                    Iconsax.calendar_1,
                    color: AppColors.darkBlue,
                    size: 20,
                    weight: 20,
                  ),
                  // validator: (val) {
                  //   if (val!.isEmpty) {
                  //     return 'Business Phone Number is Required';
                  //   }

                  //   return null;
                  // },
                ),
                20.0.sbH,
                const CustomInputText(
                  // controller: model.vendorPhone,
                  inputType: TextInputType.phone,
                  hintText: 'Enter Appointment Time',
                  prefix: Icon(
                    Iconsax.clock,
                    color: AppColors.darkBlue,
                    size: 20,
                    weight: 20,
                  ),
                  // validator: (val) {
                  //   if (val!.isEmpty) {
                  //     return 'Business Phone Number is Required';
                  //   }

                  //   return null;
                  // },
                ),
                60.0.sbH,
                AppButton(
                  title: "Book Now",
                  fontSize: 15,
                  onPressed: () {
                    // FocusManager.instance.primaryFocus?.unfocus();
                    // if (model.formKey.currentState!.validate()) {
                    //   model.processVendorCreation();
                    // }
                    navigationService.push(const BookedCng());
                    showCustomToast('Booked Successfully, Valid for 24hours',
                        toastType: ToastType.success, time: 10);
                  },
                ),
                40.0.sbH,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
