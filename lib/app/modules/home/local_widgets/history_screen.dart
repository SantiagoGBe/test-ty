import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_tyba/app/modules/home/controllers/home_controller.dart';

class History extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => controller.loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : listHistory()),
    );
  }

  Widget listHistory() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: controller.history.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(controller.history[index]['search']),
          );
        });
  }
}
