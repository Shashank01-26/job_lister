import 'package:equatable/equatable.dart';
import 'package:job_lister/Utils/api_error_model.dart';

abstract class ApiModel<T> extends Equatable{
  late final ApiErrorModel? apiErrorModel;
  late final String? status;
  Map<String, Object?> toJson();
  T fromJson(Map<String, dynamic> json);
}