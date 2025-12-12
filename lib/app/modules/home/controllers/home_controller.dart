import 'package:flutter/material.dart';
import 'package:gallery_x/app/modules/gallery/views/gallery_view.dart';
import 'package:gallery_x/app/modules/settings/views/settings_view.dart';
import 'package:gallery_x/app/modules/upload/views/upload_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt currentScreenIndex = 0.obs;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [GalleryView(),UploadView(),SettingsView()];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
