import 'package:flutter/material.dart';
import 'package:gallery_x/app/modules/gallery/controllers/gallery_controller.dart';
import 'package:gallery_x/app/modules/gallery/views/gallery_view.dart';
import 'package:gallery_x/app/modules/settings/controllers/settings_controller.dart';
import 'package:gallery_x/app/modules/settings/views/settings_view.dart';
import 'package:gallery_x/app/modules/upload/controllers/upload_controller.dart';
import 'package:gallery_x/app/modules/upload/views/upload_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentScreenIndex = 0.obs;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [GalleryView(), UploadView(), SettingsView()];

  void changeTab(int index) {
    currentScreenIndex.value = index;
    if (index == 0 && !Get.isRegistered<GalleryController>()) {
      Get.put(GalleryController());
    } else if (index == 1 && !Get.isRegistered<UploadController>()) {
      Get.put(UploadController());
    } else if (index == 2 && !Get.isRegistered<SettingsController>()) {
      Get.put(SettingsController());
    }
  }
}
