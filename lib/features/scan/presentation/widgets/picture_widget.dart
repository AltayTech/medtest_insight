import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/failure.dart';
import '../../business/entities/scan_entity.dart';
import '../providers/scan_provider.dart';

class PictureWidget extends StatefulWidget {
  const PictureWidget({super.key});

  @override
  State<PictureWidget> createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
  @override
  Widget build(BuildContext context) {
    ScanEntity? scan = Provider.of<ScanProvider>(context).scan;
    Failure? failure = Provider.of<ScanProvider>(context).failure;
    debugPrint(scan?.image.toString());
    debugPrint(failure.toString());

    if (scan != null) {
      return Center(
          child: Image(
        image: scan.image!,
      ));
    } else if (failure != null) {
      return Center(
        child: Text(failure.errorMessage),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
