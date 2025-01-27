import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/controllers/gallery.vm.dart';
import 'package:flutter_template/controllers/home.vm.dart';
import 'package:flutter_template/controllers/product_vm.dart';
import 'package:flutter_template/data/repository/auth_repo.dart';
import 'package:flutter_template/data/repository/product_repo.dart';
import 'package:flutter_template/services/app_cache.dart';
import 'package:get_it/get_it.dart';
import '../controllers/base.vm.dart';
import 'navigation_service.dart';
import 'user_services.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<AppData>(() => AppData());
  getIt.registerLazySingleton<UserServices>(() => UserServices());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository());

  /*getIt.registerLazySingleton<AppCache>(() => AppCache());
  */
  registerViewModel();
}

void registerViewModel() {
  getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  getIt.registerFactory<AuthViewModel>(() => AuthViewModel());
  getIt.registerFactory<ProductViewModel>(() => ProductViewModel());
  getIt.registerFactory<GalleryViewModel>(() => GalleryViewModel());

  //View Model
}
