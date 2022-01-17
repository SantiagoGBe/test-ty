import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt _menuOption = 0.obs;
  int get menuOption => _menuOption.value;
  set menuOption(int value) => _menuOption.value = value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
