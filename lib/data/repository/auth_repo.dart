// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:flutter_template/config/urlPath.dart';
import 'package:flutter_template/data/https.dart';
import 'package:flutter_template/services/app_cache.dart';
import 'package:flutter_template/services/locator.dart';

class AuthRepository {
  Future register(Map<String, dynamic> data) async {
    var response = await httpPost(
      "${UrlPath.register}",
      data,
    );
    print("FIRST$response");
    final responseData = (response.data);
    print("SECOND$responseData");

    if (response.statusCode == 201) {
      print(responseData);
    }

    // trying to get the token from the response and storing using sharedPreferences

    return responseData;
  }

  Future emailVerify(Map<String, dynamic> data) async {
    var response = await httpPost(
      "${UrlPath.emailVerify}",
      data,
    );
    final responseData = (response.data);
    // trying to get the token from the response and storing using sharedPreferences

    return responseData;
  }

  Future resendVerifyEmail(Map<String, dynamic> data) async {
    var response = await httpPost(
      "${UrlPath.resendVerifyEmail}",
      data,
    );
    final responseData = (response.data);

    if (response.statusCode == 200) {}
    // trying to get the token from the response and storing using sharedPreferences

    return responseData;
  }

  Future login(Map<String, dynamic> data) async {
    var response = await httpPost(
      "${UrlPath.login}",
      data,
    );
    final responseData = (response.data);

    print(responseData);

    if (response.statusCode == 200) {
      // Extracting data from the response
      final userToken = responseData['token'].toString();
      final userID = responseData['user_id'].toString();
      final fname = responseData['data']['first_name'].toString();
      final lname = responseData['data']['last_name'].toString();
      final email = responseData['data']['email'].toString();
      final phone = responseData['data']['phone_number'].toString();
      final gender = responseData['data']['gender']?.toString();
      final homeAddress = responseData['data']['home_address']?.toString();
      final city = responseData['data']['city']?.toString();
      final state = responseData['data']['state']?.toString();
      final landmark = responseData['data']['landmark']?.toString();
      final isRetailer =
          responseData['data']['is_retailer'] as bool; // Boolean value
      final isEmailVerified =
          responseData['data']['is_email_verified'] as bool; // Boolean value
      final vendorRegNo = responseData['data']['vendor_reg_no']?.toString();
      final vendorCertUrl =
          responseData['data']['vendor_certificate_url']?.toString();

      // Saving data using shared preferences
      userServices.cache.setStringPreference('token', userToken);
      userServices.cache.setStringPreference('id', userID);
      userServices.cache.setStringPreference('first_name', fname);
      userServices.cache.setStringPreference('last_name', lname);
      userServices.cache.setStringPreference('email', email);
      userServices.cache.setStringPreference('phone_number', phone);
      userServices.cache.setStringPreference(
          'gender', gender ?? ''); // Save empty string if null
      userServices.cache.setStringPreference('home_address', homeAddress ?? '');
      userServices.cache.setStringPreference('city', city ?? '');
      userServices.cache.setStringPreference('state', state ?? '');
      userServices.cache.setStringPreference('landmark', landmark ?? '');
      userServices.cache.setBoolPreference(
          'is_retailer', isRetailer); // Save boolean directly
      userServices.cache.setBoolPreference(
          'is_email_verified', isEmailVerified); // Save boolean directly
      userServices.cache
          .setStringPreference('vendor_reg_no', vendorRegNo ?? '');
      userServices.cache
          .setStringPreference('vendor_certificate_url', vendorCertUrl ?? '');

      // Retrieving saved data for verification
      String? token = userServices.cache.getStringPreference('token');
      String? iD = userServices.cache.getStringPreference('id');
      String? firstName = userServices.cache.getStringPreference('first_name');
      String? lastName = userServices.cache.getStringPreference('last_name');
      String? savedEmail = userServices.cache.getStringPreference('email');
      String? savedPhone =
          userServices.cache.getStringPreference('phone_number');
      String? savedGender = userServices.cache.getStringPreference('gender');
      String? savedHomeAddress =
          userServices.cache.getStringPreference('home_address');
      String? savedCity = userServices.cache.getStringPreference('city');
      String? savedState = userServices.cache.getStringPreference('state');
      String? savedLandmark =
          userServices.cache.getStringPreference('landmark');
      bool? savedIsRetailer = userServices.cache
          .getBoolPreference('is_retailer'); // Retrieve boolean
      bool? savedIsEmailVerified = userServices.cache
          .getBoolPreference('is_email_verified'); // Retrieve boolean
      String? savedVendorRegNo =
          userServices.cache.getStringPreference('vendor_reg_no');
      String? savedVendorCertUrl =
          userServices.cache.getStringPreference('vendor_certificate_url');

      // Print statements for debugging
      print('Token:::: $token');
      print('ID:::: $iD');
      print('First Name:::: $firstName');
      print('Last Name:::: $lastName');
      print('Email:::: $savedEmail');
      print('Phone Number:::: $savedPhone');
      print('Gender:::: $savedGender');
      print('Home Address:::: $savedHomeAddress');
      print('City:::: $savedCity');
      print('State:::: $savedState');
      print('Landmark:::: $savedLandmark');
      print('Is Retailer:::: $savedIsRetailer');
      print('Vendor Registration No:::: $savedVendorRegNo');
      print('Vendor Certificate URL:::: $savedVendorCertUrl');
      print('Is Email Verified:::: $savedIsEmailVerified');

      userServices.initializer();
    }
    // trying to get the token from the response and storing using sharedPreferences

    return response;
  }

  Future forgotPwd(Map<String, dynamic> data) async {
    var response = await httpPost(
      "${UrlPath.forgotPwd}",
      data,
    );
    final responseData = (response.data);

    
    // trying to get the token from the response and storing using sharedPreferences

    return responseData;
  }

  Future resetPwd(Map<String, dynamic> data) async {
    var response = await httpPost(
      "${UrlPath.resetPwd}",
      data,
    );
    final responseData = (response.data);
    // trying to get the token from the response and storing using sharedPreferences

    return responseData;
  }
}
