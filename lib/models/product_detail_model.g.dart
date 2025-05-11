// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailImpl _$$ProductDetailImplFromJson(Map<String, dynamic> json) =>
    _$ProductDetailImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$$ProductDetailImplToJson(_$ProductDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'description': instance.description,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
    };
