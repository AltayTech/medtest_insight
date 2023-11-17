import 'package:flutter/material.dart';
import 'package:medtest_insight/features/scan/presentation/providers/scan_provider.dart';
import 'package:medtest_insight/features/scan/presentation/widgets/analyse_result_widget.dart';
import 'package:medtest_insight/features/scan/presentation/widgets/picture_widget.dart';
import 'package:medtest_insight/features/scan/presentation/widgets/recommend_result_widget.dart';
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width,
                    height: 0.3 * height,
                    child: const PictureWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: AnalyseResultWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: RecommendResultWidget(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.07,
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
            height: height * 0.07,
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
          SizedBox(
            height: height * 0.07,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<ScanProvider>(context, listen: false)
                      .eitherFailureOrRecommendation(locator());
                },
                child: const Text('Recommend'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
