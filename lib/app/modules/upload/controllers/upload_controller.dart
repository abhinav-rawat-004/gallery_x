import 'package:gallery_x/app/components/image_editor.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController {
  // Rx<File?> image = Rx<File?>(null);
  late XFile image;

  void pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (!pickedImage.isNull) {
        image = pickedImage!;

        Get.to(() => ImageEditor(file: image));
      }
    } catch (error) {
      print(error);
    }
  }
}
