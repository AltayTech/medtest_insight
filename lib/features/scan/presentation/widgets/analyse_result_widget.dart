import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/failure.dart';
import '../../business/entities/analyse_entity.dart';
import '../../business/entities/scan_entity.dart';
import '../providers/scan_provider.dart';

class AnalyseResultWidget extends StatefulWidget {
  const AnalyseResultWidget({super.key});

  @override
  State<AnalyseResultWidget> createState() => _AnalyseResultWidgetState();
}

class _AnalyseResultWidgetState extends State<AnalyseResultWidget> {
  @override
  Widget build(BuildContext context) {
    AnalyseEntity? analyseResult =
        Provider.of<ScanProvider>(context).analyseResult;
    Failure? failure = Provider.of<ScanProvider>(context).failure;
    debugPrint(analyseResult.toString());
    debugPrint(failure.toString());

    if (analyseResult != null) {
      return Center(
          child: Text(
        analyseResult.text,
      ));
    } else if (failure != null) {
      return Center(
        child: Text(failure.errorMessage),
      );
    } else {
      return const Center(
        child: Text('No Analyses result yet'),
      );
    }
  }
}
