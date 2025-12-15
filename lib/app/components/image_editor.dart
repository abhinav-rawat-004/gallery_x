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
  late Image image; 
    return ProImageEditor.file(
      File(file.path),
      callbacks: ProImageEditorCallbacks(
        //fix this as no editing done on the image takes place
        onImageEditingComplete: (bytes) async {
          image = Image(
            name: file.name,
            path: bytes,
            type: 'jpg',
            date: DateTime.now().toString(),
          );
          await dao.postImage(image);
          controller.getImageList();
          Get.back();
        },
        onCloseEditor: (editorMode) async {
          Get.back();
        },
      ),
    );
  }
}
