import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app/controller/theme_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/theme.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends GetView<ThemeController> {
  const MyApp({super.key});

  @override
  ThemeController get controller => Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: "GalleryX",
        theme: MyTheme.light(),
        darkTheme: MyTheme.dark(),
        themeMode: controller.themeMode.value,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
