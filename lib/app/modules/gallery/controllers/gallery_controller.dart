import 'package:gallery_x/app/data/dao/images_dao.dart';
import 'package:gallery_x/app/data/models/image.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  ImagesDao dao = ImagesDao();
  //TODO: Implement GalleryController

  RxList<Image> imageList = <Image>[].obs;

  @override
  void onInit() async {
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

  void getImageList() async {
    imageList.clear();
    imageList.addAll(await dao.getAllImages());
  }

  // File imageFile(String path) {
  //   return File(path);
  // }
}
