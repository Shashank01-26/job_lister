import 'package:http/http.dart';

abstract class JobApiEndpoint {
  JobApiEndpoint(this.endpoint,
      {
        this.params = const {},
        this.formData = const {},
      });

  final String endpoint;
  final Map<String, dynamic> params;
  final Map<String, dynamic> formData;


  void addParams(Map<String, dynamic> params) {
    this.params.addAll(params);
  }

  String _getContentType() {
    if (formData.values.isNotEmpty) {
      for (var value in formData.values) {
        if (value is MultipartFile) {
          return "multipart/form-data";
        }
      }
    }
    return "application/json";
  }
}

