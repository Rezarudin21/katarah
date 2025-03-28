import 'package:get/get.dart';
import 'package:katarahv2/app/modules/details/views/details_view.dart';
import 'package:katarahv2/app/modules/login/views/login_view.dart';
import 'package:katarahv2/app/modules/settings/views/settings_view.dart';
import 'package:katarahv2/app/modules/upload/views/upload_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
    ),
    GetPage(
      name: _Paths.UPLOAD,
      page: () => UploadImagePage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
    ),
  ];
}
