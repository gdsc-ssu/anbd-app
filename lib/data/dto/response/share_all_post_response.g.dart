// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_all_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareAllPostResponseImpl _$$ShareAllPostResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ShareAllPostResponseImpl(
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      content: (json['content'] as List<dynamic>)
          .map((e) => SharePostResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num).toInt(),
      sort: (json['sort'] as List<dynamic>)
          .map((e) => Sort.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfElements: (json['numberOfElements'] as num).toInt(),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      first: json['first'] as bool,
      last: json['last'] as bool,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$$ShareAllPostResponseImplToJson(
        _$ShareAllPostResponseImpl instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'size': instance.size,
      'content': instance.content,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'pageable': instance.pageable,
      'first': instance.first,
      'last': instance.last,
      'empty': instance.empty,
    };

_$SortImpl _$$SortImplFromJson(Map<String, dynamic> json) => _$SortImpl(
      direction: json['direction'] as String,
      property: json['property'] as String,
      ignoreCase: json['ignoreCase'] as bool,
      nullHandling: json['nullHandling'] as String,
      ascending: json['ascending'] as bool,
      descending: json['descending'] as bool,
    );

Map<String, dynamic> _$$SortImplToJson(_$SortImpl instance) =>
    <String, dynamic>{
      'direction': instance.direction,
      'property': instance.property,
      'ignoreCase': instance.ignoreCase,
      'nullHandling': instance.nullHandling,
      'ascending': instance.ascending,
      'descending': instance.descending,
    };

_$PageableImpl _$$PageableImplFromJson(Map<String, dynamic> json) =>
    _$PageableImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      sort: (json['sort'] as List<dynamic>)
          .map((e) => Sort.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: (json['offset'] as num).toInt(),
      unpaged: json['unpaged'] as bool,
      paged: json['paged'] as bool,
    );

Map<String, dynamic> _$$PageableImplToJson(_$PageableImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'unpaged': instance.unpaged,
      'paged': instance.paged,
    };
