import 'package:get/get.dart';

import 'package:test_tyba/app/modules/home/bindings/home_binding.dart';
import 'package:test_tyba/app/modules/home/views/home_view.dart';
import 'package:test_tyba/app/modules/initial/bindings/initial_binding.dart';
import 'package:test_tyba/app/modules/initial/views/initial_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
  ];
}
