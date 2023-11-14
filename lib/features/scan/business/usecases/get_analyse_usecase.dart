import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:medtest_insight/features/scan/business/entities/scan_entity.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/analyse_entity.dart';
import '../repositories/scan_repository.dart';

class GetAnalyseUseCase {
  final ScanRepository scanRepository;

  GetAnalyseUseCase({
    required this.scanRepository,
  });

  Future<Either<Failure, AnalyseEntity>> call(ScanEntity picture) async {
    debugPrint('Analyse');
    debugPrint(picture.image.toString());

    Future<String> getText(ScanEntity picture) async {
      String text = '';
      debugPrint('picture.imageSource.path');
      debugPrint(picture.imageSource.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();
      RecognizedText recognizedText = await textDetector
          .processImage(InputImage.fromFilePath(picture.imageSource.path));
      await textDetector.close();
      for (TextBlock block in recognizedText.blocks) {
        for (TextLine textLine in block.lines) {
          text = '$text${textLine.text}\n';
        }
      }
      return text;
    }

    String analyseResult= await getText(picture);

    return await scanRepository.getAnalyse(analyseResult);
  }
}
