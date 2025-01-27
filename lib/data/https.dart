//Due to time, this is faster for me to implement.
//I will refactor this to use the existing method in the future.

// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_template/config/config.dart';
import 'package:flutter_template/services/locator.dart';
import 'package:flutter_template/services/user_services.dart';

import 'network/error_handler.dart';

UserServices userServices = getIt<UserServices>();

Dio dio = Dio(BaseOptions(
    baseUrl: Config.BASEAPI, followRedirects: true, headers: getHeaders()));

getHeaders() {
  var headrs = {
    "Accept": "application/json",
  };
  if (userServices.isUserLoggedIn) {
    headrs["Authorization"] =
        "Bearer ${userServices.cache.getStringPreference("token")}";
  }

  return headrs;
}

Future<dynamic> httpGet(String path,
    {bool hasAuth = false,
    Map<String, dynamic>? queryParam,
    String token = ""}) async {
  if (hasAuth) {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  } else {
    dio.options.headers = getHeaders();
  }
  print(dio.options.baseUrl + path);
  try {
    var response = await dio.get(path, queryParameters: queryParam);
    print(response);
    return response;
  } on DioException catch (err) {
    print("error happening @ " + dio.options.baseUrl + path);
    handleError(err);
    rethrow;
  } on Exception catch (err) {
    print(err);
    rethrow;
  } catch (err) {
    print(err);
    rethrow;
  }
}

Future<dynamic> httpPost(String path, dynamic data,
    {List<MapEntry<String, MultipartFile>>? mapEntry,
    bool hasAuth = false}) async {
  dio.options.headers = getHeaders();
  print("${Config.BASEAPI}$path");
  try {
    if (data is FormData) {
      if (mapEntry != null) {
        data.files.addAll(mapEntry);
      }
    } else {
      data = FormData.fromMap(data);
    }

    var response = await dio.post(path, data: data);
    return response;
  } on DioException catch (err) {
    print("error happening @ " + dio.options.baseUrl + path);
    handleError(err);
    print(err);
    rethrow;
  } on Exception catch (err) {
    print(err);
    rethrow;
  } catch (err) {
    print(err);
    rethrow;
  }
}

Future<dynamic> httpPut(String path, dynamic fData,
    {List<MapEntry<String, MultipartFile>>? mapEntry,
    bool hasAuth = false}) async {
  dio.options.headers = getHeaders();
  //print(fData);
  print(dio.options.baseUrl + path);
  try {
    var formData = FormData.fromMap(fData);
    if (mapEntry != null) {
      formData.files.addAll(mapEntry);
    }
    var response = await dio.put(path, data: formData);
    return response;
  } on DioException catch (err) {
    handleError(err);
    print(err);
    rethrow;
  } on Exception catch (err) {
    print(err);
    rethrow;
  } catch (err) {
    print(err);
    rethrow;
  }
}

Future<dynamic> httpDelete(String path, dynamic fData,
    {bool hasAuth = false}) async {
  dio.options.headers = getHeaders();
  print(dio.options.baseUrl + path);
  try {
    var formData;
    if (fData != null) {
      formData = FormData.fromMap(fData);
    }

    var response = await dio.delete(path, data: formData);
    return response;
  } on DioException catch (err) {
    handleError(err);
    print(err);
    rethrow;
  } on Exception catch (err) {
    print(err);
    rethrow;
  } catch (err) {
    print(err);
    rethrow;
  }
}
