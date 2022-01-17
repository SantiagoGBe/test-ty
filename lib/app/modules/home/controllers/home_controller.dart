import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_tyba/app/data/models/search.dart';
import 'package:test_tyba/app/modules/home/providers/home_api.dart';
import 'package:test_tyba/app/routes/app_pages.dart';

class HomeController extends GetxController {
  late final HomeAPI api;
  late final GetStorage box;

  final RxList places = [].obs;

  final RxList history = [].obs;

  final RxInt _menuOption = 0.obs;
  int get menuOption => _menuOption.value;
  set menuOption(int value) => _menuOption.value = value;

  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  final searchController = TextEditingController();

  search() async {
    loading = true;
    final token = box.read('token');
    final Search search = Search(userId: token, search: searchController.text);
    places.value = await api.search(search);
    loading = false;
  }

  loadSites() async {
    loading = true;
    history.value = await api.loadHistory();
    loading = false;
  }

  logout() {
    final token = box.erase();
    Get.offAllNamed(AppPages.INITIAL);
  }

  @override
  void onInit() {
    super.onInit();
    api = HomeAPI();
    box = GetStorage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
