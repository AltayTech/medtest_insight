import 'package:flutter/material.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:medtest_insight/features/scan/presentation/widgets/analyse_result_widget.dart';
import 'package:medtest_insight/features/scan/presentation/widgets/picture_widget.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);
  static const routeName = '/ScanScreen';

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          const PictureWidget(),
          const AnalyseResultWidget(),
          const Spacer(),
          SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<ScanProvider>(context, listen: false)
                      .eitherFailureOrScan();
                },
                child: const Text('Pick image'),
              ),
            ),
          ),
          SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<ScanProvider>(context, listen: false)
                      .eitherFailureOrAnalyse(locator());
                },
                child: const Text('Analyze'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
