import 'package:flutter/material.dart';
import 'package:gallery_x/app/modules/gallery/views/photo_view.dart';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../controllers/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  const GalleryView({super.key});

  @override
  GalleryController get controller => Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return (controller.imageList.isEmpty)
            ? Center(
                child: Text(
                  'Uploaded images will be shown here',
                  style: TextStyle(fontSize: 24),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: controller.imageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        PhotoViewer(file: controller.imageList[index].path),
                      );
                    },
                    child: Image.memory(
                      controller.imageList[index].path,
                      fit: BoxFit.cover,
                    ),
                  );
                } /*Image.network(imageList[index], fit: BoxFit.cover)*/,
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Controller controller = Get.find<Controller>();
          controller.changeTheme(!controller.isDark);
        },
      ),
    );
  }
}
