import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.menuOption,
            onTap: (value) => controller.menuOption = value,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'History',
              )
            ],
          )),
      body: Center(
        child: TextButton(
          child: Text('remove'),
          onPressed: () {
            final box = GetStorage();
            box.erase();
          },
        ),
      ),
    );
  }
}
