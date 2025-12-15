import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_controller.dart';

class UploadView extends GetView<UploadController> {
  const UploadView({super.key});

  @override
  UploadController get controller => Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text('Want to edit the image? Upload file below', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical:8),
              onPressed: () {
                controller.pickImage();
              },
              child: Text('Upload', style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold )),
            ),
          ],
        ),
      ),
    );
  }
}
