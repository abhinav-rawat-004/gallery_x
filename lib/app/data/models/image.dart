
import 'dart:typed_data';

class Image {
    String name;
    Uint8List path;
    String type;
    String date;

    Image({
        required this.name,
        required this.path,
        required this.type,
        required this.date,
    });

    factory Image.fromMap(Map<String, dynamic> map) {
      return Image(
        name: map["name"],
        path: map["path"],
        type: map["type"],
        date: map["date"],
      );
    }

    Map<String, dynamic> toMap() => {
        "name": name,
        "path": path,
        "type": type,
        "date": date,
    };
}