import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatting_messages_response.freezed.dart';
part 'chatting_messages_response.g.dart';

@freezed
class PageResponse with _$PageResponse {
  const factory PageResponse({
    required int totalPages,
    required int totalElements,
    required int size,
    required List<ChatMessageResponse> content,
    required int number,
    required List<Sort> sort, // ✅ List로 변경
    required Pageable pageable,
    required int numberOfElements,
    required bool first,
    required bool last,
    required bool empty,
  }) = _PageResponse;

  factory PageResponse.fromJson(Map<String, dynamic> json) =>
      _$PageResponseFromJson(json);
}

@freezed
class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required int id,
    required int chatRoomId,
    required int senderId,
    required String message,
    required DateTime timestamp,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}

@freezed
class Sort with _$Sort {
  const factory Sort({
    required bool? empty,
    required bool? sorted,
    required bool? unsorted,
  }) = _Sort;

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
}

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    required int offset,
    required List<Sort> sort, // ✅ 여기도 List로 맞춰야 함
    required bool paged,
    required int pageNumber,
    required int pageSize,
    required bool unpaged,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
}
