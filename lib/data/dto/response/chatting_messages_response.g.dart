// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatting_messages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageResponseImpl _$$PageResponseImplFromJson(Map<String, dynamic> json) =>
    _$PageResponseImpl(
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      content: (json['content'] as List<dynamic>)
          .map((e) => ChatMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      number: (json['number'] as num).toInt(),
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      pageable: Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
      numberOfElements: (json['numberOfElements'] as num).toInt(),
      first: json['first'] as bool,
      last: json['last'] as bool,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$$PageResponseImplToJson(_$PageResponseImpl instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'size': instance.size,
      'content': instance.content,
      'number': instance.number,
      'sort': instance.sort,
      'pageable': instance.pageable,
      'numberOfElements': instance.numberOfElements,
      'first': instance.first,
      'last': instance.last,
      'empty': instance.empty,
    };

_$ChatMessageResponseImpl _$$ChatMessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageResponseImpl(
      id: (json['id'] as num).toInt(),
      chatRoomId: (json['chatRoomId'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ChatMessageResponseImplToJson(
        _$ChatMessageResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatRoomId': instance.chatRoomId,
      'senderId': instance.senderId,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$SortImpl _$$SortImplFromJson(Map<String, dynamic> json) => _$SortImpl(
      empty: json['empty'] as bool,
      sorted: json['sorted'] as bool,
      unsorted: json['unsorted'] as bool,
    );

Map<String, dynamic> _$$SortImplToJson(_$SortImpl instance) =>
    <String, dynamic>{
      'empty': instance.empty,
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
    };

_$PageableImpl _$$PageableImplFromJson(Map<String, dynamic> json) =>
    _$PageableImpl(
      offset: (json['offset'] as num).toInt(),
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
      paged: json['paged'] as bool,
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      unpaged: json['unpaged'] as bool,
    );

Map<String, dynamic> _$$PageableImplToJson(_$PageableImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'sort': instance.sort,
      'paged': instance.paged,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'unpaged': instance.unpaged,
    };
