import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_tyba/app/modules/home/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            controller: controller.searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_city),
                labelText: 'Nombre de la ciudad'),
          ),
          TextButton(
              onPressed: () {
                controller.search();
              },
              child: Text('Buscar ')),
          Expanded(
              child: Obx(
            () => controller.loading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : listPlaces(),
          ))
        ],
      ),
    );
  }

  Widget listPlaces() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: controller.places.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(controller.places[index]['title']),
          );
        });
  }
}
