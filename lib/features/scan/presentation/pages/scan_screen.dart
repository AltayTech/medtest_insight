import 'package:flutter/material.dart';
import 'package:medtest_insight/core/errors/failure.dart';
import 'package:medtest_insight/features/scan/business/entities/scan_entity.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:provider/provider.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);
  static const routeName = '/ScanScreen';

  @override
  Widget build(BuildContext context) {
    ScanEntity? scan = Provider.of<ScanProvider>(context).scan;
    Failure? failure = Provider.of<ScanProvider>(context).failure;
    late Widget widget;
    if (scan != null) {
      widget = Center(
          child: Image(
        image: scan.image!,
      ));
    } else if (failure != null) {
      widget = Center(
        child: Text(failure.errorMessage),
      );
    } else {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: widget,
      ),
    );
  }
}
