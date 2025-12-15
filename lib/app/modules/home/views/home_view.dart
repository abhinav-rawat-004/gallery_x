import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final List imageList = ['anc'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery X'), centerTitle: true),
      body: Obx(() => controller.screens[controller.currentScreenIndex()]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentScreenIndex(),
          items: controller.bottomNavBarItems,
          onTap: (value) => controller.changeTab(value),
        ),
      ),
    );
  }
}
