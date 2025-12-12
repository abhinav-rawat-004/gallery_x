import 'dart:io';
import 'package:gallery_x/app/components/image_editor.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  // Rx<File?> image = Rx<File?>(null);
  late XFile image;

  void pickImage() async {
    final _image_picker = ImagePicker();
    final picked_image = await _image_picker.pickImage(
      source: ImageSource.gallery,
    );


    if (!picked_image.isNull) {
      // print('data');
      // await picked_image!.readAsString();
      // print('data');

      // image = File(picked_image!.path);
      // print(image);

      image = picked_image!;
      print(image.name);
      print(image.runtimeType);
      print(image.path);

      Get.to(() => ImageEditor(file: image));
    }
  }

  //TODO: Implement UploadController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
