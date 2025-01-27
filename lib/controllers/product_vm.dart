// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/base.vm.dart';
import 'package:flutter_template/services/app_cache.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

class ProductViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();

  final TextEditingController productName = TextEditingController();
  final TextEditingController deliveryfee = TextEditingController();
  final TextEditingController productDesc = TextEditingController();
  final TextEditingController productPrice = TextEditingController();
  final TextEditingController productQty = TextEditingController();
  final TextEditingController address = TextEditingController();

  String selectedCategoryId = '';

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

  String productImage = "";

  String? source;
  File? imageFile;

  Future<void> processAddProduct() async {
    startLoader();

    Map<String, dynamic> data = {
      "product_name": productName.text,
      "product_description": productDesc.text,
      "product_price": productPrice,
      "number_in_stock": productQty.text,
      "address": address.text,
      "delivery_fee": deliveryfee.text,
    };

    String imageExtension = "";
    List<MapEntry<String, MultipartFile>> mapEntry = [];
    MediaType mediaType;
    if (productImage.isNotEmpty) {
      imageExtension = productImage.split('.').last.toLowerCase();
      if (imageExtension == 'jpeg' || imageExtension == 'jpg') {
        mediaType = MediaType('image', 'jpeg');
      } else if (imageExtension == 'png') {
        mediaType = MediaType('image', 'png');
      } else {
        // Handle other image types if needed
        mediaType = MediaType('image', 'jpeg'); // Default to JPEG
      }
      mapEntry = [
        MapEntry(
          'product_image_upload',
          await MultipartFile.fromFile(productImage, contentType: mediaType),
        )
      ];
    }

    try {
      var response = await productRepo.addProduct(
        FormData.fromMap(data),
        mapEntry,
      );

      if (response != null) {
        await userService.initializer();
        stopLoader();

        showCustomToast("Product Added Successfully!",
            toastType: ToastType.success);
        navigationService.goBack();
      } else {
        stopLoader();
      }
      // Handle post verification actions here, such as navigating to the home screen
    } catch (e, l) {
      stopLoader();

      print(e);
      print(l);
      showCustomToast("Upload Failed", toastType: ToastType.error);
    }
  }

  // Future<bool> deleteProduct(String productId) async {
  //   try {
  //     var result = await productRepo.deleteProduct(productId: productId);
  //     return result;
  //   } catch (e, l) {
  //     stopLoader();
  //     print(e);
  //     print(l);
  //   }
  //   return false;
  // }

  // Future<void> processUpdateProduct(
  //     {required String iD, required String productId}) async {
  //   startLoader();

  //   String imageExtension = "";
  //   List<MapEntry<String, MultipartFile>> mapEntry = [];
  //   MediaType mediaType;
  //   if (productImage.isNotEmpty) {
  //     imageExtension = productImage.split('.').last.toLowerCase();
  //     if (imageExtension == 'jpeg' || imageExtension == 'jpg') {
  //       mediaType = MediaType('image', 'jpeg');
  //     } else if (imageExtension == 'png') {
  //       mediaType = MediaType('image', 'png');
  //     } else {
  //       // Handle other image types if needed
  //       mediaType = MediaType('image', 'jpeg'); // Default to JPEG
  //     }
  //     mapEntry = [
  //       MapEntry(
  //         'product_image',
  //         await MultipartFile.fromFile(productImage, contentType: mediaType),
  //       )
  //     ];
  //   }

  //   Map<String, dynamic> data = {
  //     'id': productId,
  //     "product_name": productName.text,
  //     "product_category": selectedCategoryId,
  //     "product_description": productDesc.text,
  //     "quantity": productQty.text,
  //     "amount": productPrice.text,
  //   };

  //   try {
  //     var response = await productRepo
  //         .updateProduct(FormData.fromMap(data), mapEntry, vendorId: iD);

  //     if (response != null) {
  //       await userService.initializer();
  //       stopLoader();

  //       showCustomToast("Product Added Successfully!",
  //           toastType: ToastType.success);
  //       navigationService.goBack();
  //     } else {
  //       stopLoader();
  //     }
  //     // Handle post verification actions here, such as navigating to the home screen
  //   } catch (e, l) {
  //     stopLoader();

  //     print(e);
  //     print(l);
  //     showCustomToast("Upload Failed", toastType: ToastType.error);
  //   }
  // }

  // Future<List<Product>> getVendorsProducts(String vendorId) async {
  //   try {
  //     startLoader();
  //     var products = await productRepo.getVendorProducts(vendorId);
  //     stopLoader();
  //     return products;
  //   } catch (e, l) {
  //     stopLoader();
  //     print(e);
  //     print(l);
  //   }
  //   return [];
  // }
}
