import '../../../../../core/constants/constants.dart';
import '../../business/entities/scan_entity.dart';

class ScanModel extends ScanEntity {
  const ScanModel({
    required String scan,
  }) : super(
          scan: scan,
        );

  factory ScanModel.fromJson({required Map<String, dynamic> json}) {
    return ScanModel(
      scan: json[kScan],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kScan: scan,
    };
  }
}
