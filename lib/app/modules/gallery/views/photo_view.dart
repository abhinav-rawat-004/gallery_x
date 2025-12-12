import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends GetView {
  const PhotoViewer({super.key, required this.file});
  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhotoView'),
        centerTitle: true,
      ),
      body: PhotoView(imageProvider:FileImage(file))
    );
  }
}
