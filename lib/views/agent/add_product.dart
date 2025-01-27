import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/controllers/product_vm.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/resources/events.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/app_input_text.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/base.dart';
import 'package:iconsax/iconsax.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});
  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  ImageProvider<Object> selectedImage =
      const AssetImage("assets/images/avatar1.jpg");

  listenForEvent(
      ProductViewModel model, ApplicationEvent event, BuildContext context) {
    if (event.type == 'avatar_changed_addproduct') {
      setState(() {
        model.productImage = event.data["image"];
        selectedImage = FileImage(File(event.data["image"]));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductViewModel>(
        onModelReady: (model) {},
        onListenForEvent: (model, event) {
          listenForEvent(model, event, context);
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              leading: InkWell(
                  onTap: () {
                    navigationService.goBack();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 19,
                  )),
              title: const Column(
                children: [
                  AutoSizeText(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      20.0.sbH,
                      const AutoSizeText(
                        'Tap to Upload a clear Product Image',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      10.0.sbH,
                      Container(
                        width: 350.w,
                        height: 250.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: selectedImage, fit: BoxFit.cover),
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.blue,
                            )),
                        child: InkWell(
                          onTap: () {
                            AppPhotoBottomSheet.bottomSheetBuilder(
                                const AppImagePicker(
                                  changeEvent: 'avatar_changed_addproduct',
                                ),
                                context);
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.blue,
                                  )),
                              child: const CircleAvatar(
                                backgroundColor: AppColors.white,
                                radius: 30,
                                child: Icon(
                                  Iconsax.camera,
                                  color: AppColors.orange,
                                  weight: 0.5,
                                  //  color: Color(0xff035F5C),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.productName,
                        inputType: TextInputType.name,
                        hintText: 'Enter Product Name',
                        prefix: const Icon(
                          Iconsax.shopping_bag,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Product Name is Required';
                          }

                          return null;
                        },
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.productDesc,
                        inputType: TextInputType.text,
                        hintText: 'Enter Product Description',
                        prefix: const Icon(
                          Iconsax.note,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.productQty,
                        inputType: TextInputType.number,
                        hintText: 'Enter No. In Stock',
                        prefix: const Icon(
                          Iconsax.calculator,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      30.0.sbH,
                      CustomInputText(
                        // controller: model.productPrice,
                        inputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        hintText: 'Enter Product Price',
                        prefix: const Icon(
                          Iconsax.money,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.address,
                        inputType: TextInputType.text,
                        hintText: 'Enter Address',
                        prefix: const Icon(
                          Iconsax.note,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      30.0.sbH,
                      CustomInputText(
                        controller: model.deliveryfee,
                        inputType: TextInputType.number,
                        hintText: 'Enter Delivery fee',
                        prefix: const Icon(
                          Iconsax.note,
                          color: AppColors.darkBlue,
                          size: 20,
                          weight: 20,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Required';
                          }

                          return null;
                        },
                      ),
                      40.0.sbH,
                      AppButton(
                        title: "Add Product",
                        fontSize: 15,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (model.formKey.currentState!.validate()) {
                            if (model.productImage == "") {
                              showCustomToast(
                                  "Please Select Clear Photo Image For The Product",
                                  toastType: ToastType.error);
                              return;
                            }
                            model.processAddProduct();
                          }
                        },
                      ),
                      40.0.sbH,
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
