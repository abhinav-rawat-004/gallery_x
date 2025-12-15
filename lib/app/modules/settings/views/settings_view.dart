import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  SettingsController get controller => Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height,
      child: Obx(
        () => Column(
          children: [
            ListTile(
              title: Text(
                'App',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.appName().toUpperCase(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                'App Version',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.appVersion(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: controller.darkMode(),
                onChanged: (value) {
                  controller.darkMode(value);
                  controller.toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
