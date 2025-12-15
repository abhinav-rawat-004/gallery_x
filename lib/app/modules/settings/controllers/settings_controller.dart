import 'package:gallery_x/app/controller/theme_controller.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void toggleTheme() {
    ThemeController appController = Get.find<ThemeController>();
    try {
      appController.toggleTheme();
    } catch (error) {
      print(error);
    }
  }
}
