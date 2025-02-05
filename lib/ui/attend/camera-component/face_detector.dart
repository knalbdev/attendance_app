import 'dart:math';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:face_recognition/utils/google_ml_kit.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorComponent {
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
    enableTracking: true,
    enableLandmarks: true,
  ));

  Future<void> detectFaces(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final faces = await faceDetector.processImage(inputImage);

    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;

      // untuk menghandle posisi wajah secara vertikal
      final double? verticalPosition = face.headEulerAngleY;

      // untuk menghandle posisi wajah secara horizontal
      final double? horizontalPosition = face.headEulerAngleZ;

      // perkondisian apabila face landmark sudah aktif, ditandai oleh (mulut, mata, pipi, hidung, dan telinga)
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final Point<int> leftEarPosition = leftEar.position;
        print("Left Ear Position: $leftEarPosition");
      }

      // perkondisian apabila wajahnya terdeteksi (ditandai dengan bibir tersenyum)
      if (face.smilingProbability != null) {
        final double? smileProbability = face.smilingProbability;
        print("Smile Probability: $smileProbability");
      }

      // perkondisian apabila fitur tracking wajah sudah aktif
      if (face.trackingId != null) {
        final int? trackingId = face.trackingId;
        print("Tracking ID: $trackingId");
      }
    }
  }
}