// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportResponseEntity _$$_ReportResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_ReportResponseEntity(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      reason: json['reason'] as String?,
      userId: json['userId'] as int?,
      userAdvertisementId: json['userAdvertisementId'] as int?,
    );

Map<String, dynamic> _$$_ReportResponseEntityToJson(
        _$_ReportResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'reason': instance.reason,
      'userId': instance.userId,
      'userAdvertisementId': instance.userAdvertisementId,
    };
