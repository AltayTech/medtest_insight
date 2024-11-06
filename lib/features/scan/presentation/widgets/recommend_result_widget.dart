import 'package:flutter/material.dart';
import 'package:medtest_insight/features/scan/business/entities/recommendation_entity.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/failure.dart';
import '../../business/entities/analyse_entity.dart';
import '../../business/entities/scan_entity.dart';
import '../providers/scan_provider.dart';

class RecommendResultWidget extends StatefulWidget {
  const RecommendResultWidget({super.key});

  @override
  State<RecommendResultWidget> createState() => _RecommendResultWidgetState();
}

class _RecommendResultWidgetState extends State<RecommendResultWidget> {
  @override
  Widget build(BuildContext context) {
    RecommendationEntity? recommendationEntity =
        Provider.of<ScanProvider>(context).recommendationEntity;
    Failure? failure = Provider.of<ScanProvider>(context).failure;
    debugPrint(recommendationEntity.toString());
    debugPrint(failure.toString());

    if (recommendationEntity != null) {
      return Center(
          child: Text(
        recommendationEntity.result,
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
