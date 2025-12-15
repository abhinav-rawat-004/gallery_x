import 'package:flutter/material.dart' hide Image;
import 'package:gallery_x/app/data/models/image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends GetView {
  const PhotoViewer({super.key, required this.file});
  final Image file;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(file.date);
    return Scaffold(
      appBar: AppBar(title: const Text('PhotoView'), centerTitle: true),
      body: Stack(
        children: [
          PhotoView(imageProvider: MemoryImage(file.path)),
          Positioned(
            left: 12,
            top: 12,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.name,
                    style: TextStyle(color: Colors.yellow, fontSize: 20),
                  ),
                  Text(
                    '${DateFormat.yMMMMEEEEd().format(date)} ${TimeOfDay.fromDateTime(date).toString().substring(9,16)}',
                    style: TextStyle(color: Colors.yellow, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
