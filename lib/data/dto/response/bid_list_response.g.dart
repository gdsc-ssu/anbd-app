// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BidResponseImpl _$$BidResponseImplFromJson(Map<String, dynamic> json) =>
    _$BidResponseImpl(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      donation: (json['donation'] as num).toInt(),
      isSelected: json['isSelected'] as bool?,
      user: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BidResponseImplToJson(_$BidResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'donation': instance.donation,
      'isSelected': instance.isSelected,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String?,
      gender: json['gender'] as String,
      birthDate: json['birthDate'] as String?,
      neighborhood: json['neighborhood'] as String,
      shareCategories: json['shareCategories'] as List<dynamic>,
      reliability: (json['reliability'] as num).toInt(),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'neighborhood': instance.neighborhood,
      'shareCategories': instance.shareCategories,
      'reliability': instance.reliability,
    };
