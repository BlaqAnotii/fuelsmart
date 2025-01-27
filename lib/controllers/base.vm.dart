import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/data/repository/auth_repo.dart';
import 'package:flutter_template/data/repository/product_repo.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/app_cache.dart';
import '../services/locator.dart';
import '../services/user_services.dart';

enum ViewState { Idle, Loading, Success, Error }

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  String? errorMessage;
  NavigationService navigationService = getIt<NavigationService>();
  AuthRepository authRepo = getIt<AuthRepository>();
  ProductRepository productRepo = getIt<ProductRepository>();

  UserServices userService = getIt<UserServices>();
  AppData cache = getIt<AppData>();

  ViewState get viewState => _viewState;

  int cartItemsCount = 0;
  String? source;
  File? imageFile;

  set viewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }

  void setError(String? error) {
    errorMessage = error;
    notifyListeners();
  }

  bool isLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }
}
