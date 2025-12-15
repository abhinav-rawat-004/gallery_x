import 'package:flutter/material.dart';
import 'package:gallery_x/app/controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsController extends GetxController {
  RxString appName = ''.obs;
  RxString appVersion = ''.obs;
  RxBool darkMode = false.obs;

  ThemeController appController = Get.find<ThemeController>();

  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName(packageInfo.appName);
    appVersion(packageInfo.version);
    print(appController.storage.read('themeMode'));
    if (appController.storage.read('themeMode') == ThemeMode.dark.name) {
      darkMode(true);
      print(darkMode);
    } else {
      darkMode(false);
      print(darkMode);
    }
  }

  void toggleTheme() {
    try {
      appController.toggleTheme();
    } catch (error) {
      print(error);
    }
  }
}
