import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_tyba/app/modules/home/local_widgets/history_screen.dart';
import 'package:test_tyba/app/modules/home/local_widgets/home_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Log Out',
              onPressed: () => controller.logout(),
            )
          ],
          title: Text('Test Ty'),
          centerTitle: true,
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.menuOption,
              onTap: (value) {
                controller.menuOption = value;
                if (value == 1) {
                  controller.loadSites();
                }
              },
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
        body: Obx(() => conditionalRenderHome()));
  }

  Widget conditionalRenderHome() {
    if (controller.menuOption == 0) {
      return Home();
    } else {
      return History();
    }
  }
}
