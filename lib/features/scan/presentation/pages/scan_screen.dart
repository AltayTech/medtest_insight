import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medtest_insight/core/errors/failure.dart';
import 'package:medtest_insight/features/scan/business/entities/scan_entity.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:provider/provider.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);
  static const routeName = '/ScanScreen';

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    ScanProvider scanProvider =
        Provider.of<ScanProvider>(context, listen: false);

    Provider.of<ScanProvider>(context, listen: false).eitherFailureOrScan();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScanEntity? scan = Provider.of<ScanProvider>(context).scan;
    Failure? failure = Provider.of<ScanProvider>(context).failure;


    debugPrint(scan?.image.toString());
    debugPrint(failure.toString());

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
