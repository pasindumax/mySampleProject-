// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocketError _$SocketErrorFromJson(Map<String, dynamic> json) => SocketError(
      errorType: json['errorType'] as int?,
      statusMessage: json['statusMessage'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorDetail: json['errorDetail'] as String?,
      data: json['data'] as String?,
      errorLocationId: json['errorLocationId'] as String?,
    );

Map<String, dynamic> _$SocketErrorToJson(SocketError instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorDetail': instance.errorDetail,
      'data': instance.data,
      'errorLocationId': instance.errorLocationId,
      'errorType': instance.errorType,
      'statusMessage': instance.statusMessage,
    };
