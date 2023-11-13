import 'package:dio/dio.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/params/params.dart';
import '../models/scan_model.dart';
//
// abstract class ScanRemoteDataSource {
//   Future<ScanModel> getScan({required ScanParams scanParams});
// }
//
// class ScanRemoteDataSourceImpl implements ScanRemoteDataSource {
//   final Dio dio;
//
//   ScanRemoteDataSourceImpl({required this.dio});
//
//   @override
//   Future<ScanModel> getScan({required ScanParams scanParams}) async {
//     final response = await dio.get(
//       'https://pokeapi.co/api/v2/pokemon/',
//       queryParameters: {
//         'api_key': 'if needed',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return ScanModel.fromJson(json: response.data);
//     } else {
//       throw ServerException();
//     }
//   }
// }
