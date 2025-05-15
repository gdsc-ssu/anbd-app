// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharePostResponseImpl _$$SharePostResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SharePostResponseImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      category: json['category'] as String?,
      content: json['content'] as String?,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      isSold: json['isSold'] as bool,
      hits: (json['hits'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      likeCount: (json['likeCount'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      isBid: json['isBid'] as bool,
      userProfileResponse: UserProfilesResponse.fromJson(
          json['userProfileResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SharePostResponseImplToJson(
        _$SharePostResponseImpl instance) =>
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
