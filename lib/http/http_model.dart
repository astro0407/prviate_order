import 'package:json_annotation/json_annotation.dart';

part 'http_model.g.dart';

const int RESULT_OK = 200;
const int AUTHENTICATE_FAILED = 400;
const int UNAUTHENTICATED = 401;
const int UNAUTHORIZED = 403;

@JsonSerializable()
class ApiResponse {
  int res;
  String err;
  dynamic data;

  ApiResponse({this.res, this.err, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
