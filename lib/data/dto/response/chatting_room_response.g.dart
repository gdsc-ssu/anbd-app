// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChattingRoomResponseImpl _$$ChattingRoomResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChattingRoomResponseImpl(
      id: (json['id'] as num).toInt(),
      partner: Partner.fromJson(json['partner'] as Map<String, dynamic>),
      sharePost: SharePost.fromJson(json['sharePost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChattingRoomResponseImplToJson(
        _$ChattingRoomResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partner': instance.partner,
      'sharePost': instance.sharePost,
    };

_$PartnerImpl _$$PartnerImplFromJson(Map<String, dynamic> json) =>
    _$PartnerImpl(
      userId: (json['userId'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImage: json['profileImage'] as String,
      neighborhood: json['neighborhood'] as String,
      reliability: (json['reliability'] as num).toInt(),
    );

Map<String, dynamic> _$$PartnerImplToJson(_$PartnerImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'profileImage': instance.profileImage,
      'neighborhood': instance.neighborhood,
      'reliability': instance.reliability,
    };

_$SharePostImpl _$$SharePostImplFromJson(Map<String, dynamic> json) =>
    _$SharePostImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      category: json['category'] as String,
      content: json['content'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      isSold: json['isSold'] as bool,
      hits: (json['hits'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      likeCount: (json['likeCount'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      isBid: json['isBid'] as bool,
      userProfileResponse:
          Partner.fromJson(json['userProfileResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SharePostImplToJson(_$SharePostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'content': instance.content,
      'images': instance.images,
      'type': instance.type,
      'description': instance.description,
      'location': instance.location,
      'isSold': instance.isSold,
      'hits': instance.hits,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
      'isBid': instance.isBid,
      'userProfileResponse': instance.userProfileResponse,
    };
