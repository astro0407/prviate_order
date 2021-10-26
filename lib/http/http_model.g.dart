// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
    res: json['res'] as int,
    err: json['err'] as String,
    data: json['data'],
  );
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'res': instance.res,
      'err': instance.err,
      'data': instance.data,
    };
