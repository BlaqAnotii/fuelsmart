// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/config/urlPath.dart';
import 'package:flutter_template/data/https.dart';
import 'package:flutter_template/services/app_cache.dart';
import 'package:flutter_template/services/locator.dart';

class ProductRepository {
  AppData cache = getIt<AppData>();

  Future addProduct(
    FormData data,
    List<MapEntry<String, MultipartFile>>? mapEntry,
  ) async {
    String? id = cache.getStringPreference('id');

    var response = await httpPost('${UrlPath.addProduct}$id/', data,
        mapEntry: mapEntry // Assuming auth is required
        );
    print("Response status: ${response.statusCode}");
    print("Response data: ${response.data}");
    final responseData = response.data;

    return responseData;
  }

  // Future updateProduct(
  //     FormData data, List<MapEntry<String, MultipartFile>>? mapEntry,
  //     {required String vendorId}) async {
  //   var response = await httpPost('${UrlPath.updateProduct}$vendorId', data,
  //       mapEntry: mapEntry // Assuming auth is required
  //       );
  //   print("Response status: ${response.statusCode}");
  //   print("Response data: ${response.data}");
  //   final responseData = response.data;

  //   return responseData;
  // }

  // Future<bool> deleteProduct({required String productId}) async {
  //   var response = await httpDelete(
  //       '${UrlPath.deleteProduct}$productId', null // Assuming auth is required
  //       );
  //   print("Response status: ${response.statusCode}");
  //   print("Response data: ${response.data}");
  //   final responseData = response.data;
  //   if (response.statusCode == 201) {
  //     return true;
  //   }

  //   return false;
  // }

  // Future<List<Product>> getVendorProducts(String vendorId) async {
  //   var response = await httpGet("${UrlPath.getVendorProducts}$vendorId");
  //   List<Product> products = [];
  //   if (response.statusCode == 200) {
  //     products = response.data["data"]
  //         .map<Product>((e) => Product.fromJson(e))
  //         .toList();
  //   }

  //   return products;
  // }
}
