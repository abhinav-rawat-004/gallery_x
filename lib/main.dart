import 'package:flutter/material.dart';
import 'package:gallery_x/app/theme.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class Controller extends GetxController {
  final app = GetStorage();
  bool get isDark => app.read('darkmode') ?? false;
  ThemeData get theme => isDark ? MyTheme.dark : MyTheme.light;
  void changeTheme(bool val) => app.write('darkmode', val);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return GetMaterialApp(
      title: "GalleryX",
      theme: controller.theme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
