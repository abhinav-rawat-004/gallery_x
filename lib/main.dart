import 'package:flutter/material.dart';
import 'package:gallery_x/app/theme.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class AppController extends GetxController {
  final storage = GetStorage();
  RxBool isDark = false.obs;

  Rx<ThemeData> appTheme = ThemeData.light().obs;

  @override
  void onInit() async {
    super.onInit();
    await changeAppTheme();
  }

  Future setAppTheme(ThemeData val) async {
    await storage.write('theme', val);
    await changeAppTheme();
  }

  Future<ThemeData> getAppTheme() async {
    return await storage.read('theme') ?? MyTheme.light();
  }

  Future changeAppTheme() async {
    ThemeData themeData = await getAppTheme();
    appTheme(themeData);
  }
}

class MyApp extends GetView<AppController> {
  const MyApp({super.key});

  @override
  AppController get controller => Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: "GalleryX",
        theme: controller.appTheme(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
