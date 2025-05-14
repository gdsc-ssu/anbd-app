// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profiles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfilesResponseImpl _$$UserProfilesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfilesResponseImpl(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String?,
      neighborhood: json['neighborhood'] as String,
      reliability: (json['reliability'] as num).toInt(),
    );

Map<String, dynamic> _$$UserProfilesResponseImplToJson(
        _$UserProfilesResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'neighborhood': instance.neighborhood,
      'reliability': instance.reliability,
    };
