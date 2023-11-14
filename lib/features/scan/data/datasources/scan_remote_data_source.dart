import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:medtest_insight/features/scan/data/models/recommendation_model.dart';

import '../../../../../core/errors/exceptions.dart';

class ScanRemoteDataSource {
  final Dio dio = Dio();
  String apiKey = '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';
  final String apiUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';

  Future<RecommendationModel> getRecommendation(
      {required String analyseResult}) async {
    String prompt =
        'This is medical test. You are a medical expert. analyse this data and give recommendation'
        ' $analyseResult';
    final response = await dio.get(
      apiUrl,
      data: jsonEncode({'prompt': prompt, 'max_tokens': 150}),
      queryParameters: {
        'api_key': apiKey,
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.data);
      final results = data['choices'][0]['text'];
      return RecommendationModel(id: 0, result: results);
    } else {
      throw ServerException();
    }
  }
}
