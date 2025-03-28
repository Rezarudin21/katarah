import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katarahv2/app/routes/app_pages.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Text('Admin Page')),
              ElevatedButton(onPressed: () {}, child: Text('about us')),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.HOME);
                  },
                  child: Text('logout')),
            ],
          ),
        ));
  }
}
