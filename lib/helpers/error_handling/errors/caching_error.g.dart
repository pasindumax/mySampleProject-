// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caching_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CachingError _$CachingErrorFromJson(Map<String, dynamic> json) => CachingError(
      errorMessage: json['errorMessage'] as String?,
      errorDetail: json['errorDetail'] as String?,
      data: json['data'] as String?,
      errorLocationId: json['errorLocationId'] as String?,
    );

Map<String, dynamic> _$CachingErrorToJson(CachingError instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorDetail': instance.errorDetail,
      'data': instance.data,
      'errorLocationId': instance.errorLocationId,
    };
