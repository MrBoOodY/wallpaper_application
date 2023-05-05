// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikeResponseEntity _$$_LikeResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_LikeResponseEntity(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userId: json['userId'] as int?,
      userAdvertisementId: json['userAdvertisementId'] as int?,
    );

Map<String, dynamic> _$$_LikeResponseEntityToJson(
        _$_LikeResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'userAdvertisementId': instance.userAdvertisementId,
    };
