import 'package:flutter/material.dart';
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
                onTap: () => controller.toggleTheme(),
                child: ListTile(title: Text('Theme $index ')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
