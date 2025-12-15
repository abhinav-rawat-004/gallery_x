import 'package:gallery_x/app/data/database/app_database.dart';
import 'package:gallery_x/app/data/models/image.dart';
import 'package:sembast/sembast.dart';

class ImagesDao {
  //store
  static String STORE_NAME = 'images';

  final _imageStore = intMapStoreFactory.store(STORE_NAME);

  //Singleton instance of DB
  Future<Database> get _db async => await AppDatabase.instance.database;

  //Operations
  Future<List<Image>> getAllImages() async {
    //finder
    final finder = Finder(sortOrders: [SortOrder('date',false)]);
    //operation
    final data = await _imageStore.find(await _db, finder: finder);
    //return
    return data.map((snapshot) {
      final Image img = Image.fromMap(snapshot.value);
      return img;
    }).toList();
  }

  Future postImage(Image image) async {
    await _imageStore.add(await _db, image.toMap());
  }
}
