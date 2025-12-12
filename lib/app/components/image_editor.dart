import 'dart:io';
import 'package:flutter/material.dart' hide Image;
import 'package:gallery_x/app/data/dao/images_dao.dart';
import 'package:gallery_x/app/modules/gallery/controllers/gallery_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_image_editor/pro_image_editor.dart';
import 'package:gallery_x/app/data/models/image.dart';

class ImageEditor extends StatelessWidget {
  ImageEditor({super.key, required this.file});
  final XFile file;

  final ImagesDao dao = ImagesDao();

  GalleryController get controller => Get.find<GalleryController>();

  @override
  Widget build(BuildContext context) {
    Image image = Image(
      name: file.name,
      path: file.path,
      type: 'jpg',
      date: DateTime.now().toString(),
    );
    return ProImageEditor.file(
      File(file.path),
      callbacks: ProImageEditorCallbacks(
        //fix this as no editing done on the image takes place
        onImageEditingComplete: (bytes) async {
          await dao.postImage(image);
          controller.getImageList();
          Get.back();
        },
        onCloseEditor: (editorMode) async {
          Get.back();
        },
      ),
    );

    // return ProImageEditor.network(
    //   'https://picsum.photos/id/237/2000',
    //   callbacks: ProImageEditorCallbacks(
    //     onImageEditingComplete: (Uint8List bytes) async {
    //       await Get.defaultDialog(title: 'hello');
    //       /*
    //         Your code to process the edited image, such as uploading it to your server.
    //         until

    //         You can choose to use await to keep the loading dialog visible until
    //         your code completes, or run it without async to close the loading dialog immediately.

    //         By default, the image bytes are in JPG format.
    //       */
    //       Get.back();
    //     },
    //     /*
    //       Optional: If you want haptic feedback when a line is hit, similar to WhatsApp,
    //       you can use the code below along with the vibration package.

    //         mainEditorCallbacks: MainEditorCallbacks(
    //           helperLines: HelperLinesCallbacks(
    //             onLineHit: () {
    //               Vibration.vibrate(duration: 3);
    //             }
    //           ),
    //         ),
    //       */
    //   ),
    // );
  }
}
