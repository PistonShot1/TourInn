import 'dart:io';

import 'package:flutter/material.dart';

class CapturedData extends StatefulWidget {
  final String filePath;
  const CapturedData({super.key, required this.filePath});

  @override
  State<CapturedData> createState() => _CapturedDataState();
}

class _CapturedDataState extends State<CapturedData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Captured Image'),
        ),
        body: Center(
            child: (widget.filePath != 'No image to display')
                ? Image.file(File(widget.filePath))
                : const Text('No Image to Display')));
  }
}
