import 'package:freezed_annotation/freezed_annotation.dart';
import 'share_post_response.dart';

part 'share_all_post_response.freezed.dart';
part 'share_all_post_response.g.dart';

@freezed
class ShareAllPostResponse with _$ShareAllPostResponse {
  const factory ShareAllPostResponse({
    required int totalPages,
    required int totalElements,
    required int size,
    required List<SharePostResponse> content,
    required int number,
    required List<Sort> sort,
    required int numberOfElements,
    required Pageable pageable,
    required bool first,
    required bool last,
    required bool empty,
  }) = _ShareAllPostResponse;

  factory ShareAllPostResponse.fromJson(Map<String, dynamic> json) =>
      _$ShareAllPostResponseFromJson(json);
}

@freezed
class Sort with _$Sort {
  const factory Sort({
    required String direction,
    required String property,
    required bool ignoreCase,
    required String nullHandling,
    required bool ascending,
    required bool descending,
  }) = _Sort;

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
}

@freezed
class Pageable with _$Pageable {
  const factory Pageable({
    required int offset,
    required List<Sort> sort,
    required bool unpaged,
    required bool paged,
    required int pageNumber,
    required int pageSize,
  }) = _Pageable;

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);
}
