import 'package:medtest_insight/features/scan/business/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({
    int id = 0,
    String result = '',
  }) : super(
          id: id,
          result: result,
        );

  factory RecommendationModel.fromJson({required Map<String, dynamic> json}) {
    return RecommendationModel(
      id: json['id'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'result': result,
    };
  }
}
