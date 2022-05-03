import 'package:urbanminded_assessment/core/constants/app_enums.dart';

class SiteModel {
  final String id;

  final String? image;
  final String url;
  SiteStatus status;

  /// status code or response length
  String? response;

  SiteModel(
      {required this.id,
      required this.url,
      this.image,
      this.status = SiteStatus.pending,
      this.response});
}
