
class Image {
    String name;
    String path;
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

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        name: json["name"],
        path: json["path"],
        type: json["type"],
        date: json["date"],
    );

    Map<String, String> toMap() => {
        "name": name,
        "path": path,
        "type": type,
        "date": date,
    };
}