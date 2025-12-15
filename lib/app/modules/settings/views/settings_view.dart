import 'package:flutter/material.dart';
import 'package:gallery_x/app/theme.dart';
import 'package:gallery_x/main.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Center(child: Text('Appname')),
          Text('App Version'),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  AppController appController = Get.find<AppController>();
                  try {
                    if (appController.isDark()) {
                      appController.setAppTheme(MyTheme.light());
                      appController.isDark(false);
                    } else {
                      appController.setAppTheme(MyTheme.dark());
                      appController.isDark(true);
                    }
                  } catch (error) {
                    print(error);
                  }
                },
                child: ListTile(title: Text('Theme $index ')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
