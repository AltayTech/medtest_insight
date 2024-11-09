
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meditest/features/scan/data/models/recommendation_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../core/constants/constants.dart';

class ScanRemoteDataSource {
  final Dio dio = Dio();
  String? apiKey = dotenv.env['TOKEN'];

  final String apiUrl = 'https://api.openai.com/v1/completions';
  Future<RecommendationModel> getRecommendation(
      {required String analyseResult}) async {
    String prompt = '$CPrompt $analyseResult';
    debugPrint(apiKey);

    final response = await dio.post(
      apiUrl,
      data: {
        'model': 'text-davinci-003',
        'prompt': prompt,
        'max_tokens': 1000
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
      final Map<String, dynamic> data = response.data;
      final results = data['choices'][0]['text'];
      return RecommendationModel(id: 0, result: results);
    } else {
      throw ServerException();
    }
  }
}
