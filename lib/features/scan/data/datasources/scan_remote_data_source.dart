import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medtest_insight/features/scan/data/models/recommendation_model.dart';

import '../../../../../core/errors/exceptions.dart';

class ScanRemoteDataSource {
  final Dio dio = Dio();
  String? apiKey = dotenv.env['TOKEN'];

  final String apiUrl = 'https://api.openai.com/v1/completions';

  // 'https://api.openai.com/v1/engines/davinci-codex/completions';

  Future<RecommendationModel> getRecommendation(
      {required String analyseResult}) async {
    String prompt =
        'This is medical test. You are a medical expert. analyse this data and give recommendation'
        ' $analyseResult';
    debugPrint(apiKey);

    final response = await dio.post(
      apiUrl,
      data:{
        'model': 'text-davinci-003',
        'prompt': 'What is the capital of France?',
        'max_tokens': 100
        // "prompt": prompt,
        // "max_tokens": 250,
        // 'model':"gpt-3.5-turbo-instruct",
        // "model": "gpt-3.5-turbo-instruct",
        // "prompt": "Say this is a test",
        // "max_tokens": 7,
        // "temperature": 0

      },
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      }),
    );
    debugPrint(response.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.data);
      final results = data['choices'][0]['text'];
      return RecommendationModel(id: 0, result: results);
    } else {
      throw ServerException();
    }
  }
}
