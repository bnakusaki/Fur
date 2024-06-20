import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InputPetPictureScreen extends HookWidget {
  const InputPetPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cameras = useState<List<CameraDescription>>([]);
    final cameraController = useState<CameraController?>(null);

    useMemoized(() async {
      cameras.value = await availableCameras();
      if (cameras.value.isNotEmpty) {
        cameraController.value = CameraController(
          cameras.value.first,
          ResolutionPreset.ultraHigh,
        );

        cameraController.value!.initialize().catchError((error) {
          debugPrint(error);
        });
      }
    });

    return Scaffold(
      body: cameraController.value != null ? CameraPreview(cameraController.value!) : null,
    );
  }
}
