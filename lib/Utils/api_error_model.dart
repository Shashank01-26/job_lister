import 'package:equatable/equatable.dart';

class ApiErrorModel extends Equatable{
  final String? message;

  const ApiErrorModel(this.message);
  const ApiErrorModel.empty():message = "";

  @override
  List<Object?> get props => throw UnimplementedError();

}