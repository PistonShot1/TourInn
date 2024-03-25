import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:tour_inn_app/main.dart';

class UploadContainer extends StatefulWidget {
  late List<CameraDescription> cameras;
  static String? imagePath;
  static int captures = 0;
  UploadContainer({super.key, required this.cameras});

  @override
  State<UploadContainer> createState() => _UploadContainerState();
}

class _UploadContainerState extends State<UploadContainer> {
  double currentAngle = 0.0; // Initialize the angle
  double desiredAngle = 30.0; // Set the desired angle

  late CameraController controller;
  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: CameraPreview(controller)),
        Align(
          alignment: Alignment.topCenter,
          child: StreamBuilder<CompassEvent>(
            stream: FlutterCompass.events,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return Text('Waiting for data...');
              }

              double heading = (snapshot.data!.heading)!;

              return Text(
                '${heading.toStringAsFixed(2)} degrees',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
              onPressed: _captureAndSaveImage,
              child: null,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text('${UploadContainer.captures}'),
        )
      ],
    );
  }

  Future<void> _captureAndSaveImage() async {
    try {
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/images';
      await Directory(dirPath).create(recursive: true);
      String filePath = '$dirPath/${DateTime.now()}.png';

      if (controller.value.isTakingPicture) {
        return;
      }

      try {
        filePath = (await controller.takePicture()).path;
        UploadContainer.imagePath = filePath;
        await _moveImageToDocumentsDirectory(filePath);
        setState(() {
          UploadContainer.captures = UploadContainer.captures + 1;
        });
        // Use the captured image file (filePath) as needed.
        // For example, you can display or process the image here.
      } on CameraException catch (e) {
        print('Error taking picture: $e');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _moveImageToDocumentsDirectory(String sourceFilePath) async {
    try {
      final Directory? documentsDirectory = await getExternalStorageDirectory();
      final String destinationDirectoryPath = documentsDirectory!.path;
      final String fileName =
          '${DateTime.now()}.jpg'; // Change the file name if needed
      final String destinationFilePath = '$destinationDirectoryPath/$fileName';

      // Create the destination directory if it doesn't exist
      await Directory(destinationDirectoryPath).create(recursive: true);

      // Move the file from the cache to the documents directory
      await File(sourceFilePath).copy(destinationFilePath);

      // Optionally, you can delete the original file from the cache
      await File(sourceFilePath).delete();

      print('Image moved to documents directory: $destinationFilePath');
    } catch (e) {
      print('Error moving image: $e');
    }
  }
}
