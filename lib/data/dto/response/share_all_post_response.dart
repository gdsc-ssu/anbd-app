import 'share_post_response.dart';

class ShareAllPostResponse {
  final int totalPages;
  final int totalElements;
  final int size;
  final List<SharePostResponse> content;
  final int number;
  final List<Sort> sort;
  final int numberOfElements;
  final Pageable pageable;
  final bool first;
  final bool last;
  final bool empty;

  ShareAllPostResponse({
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.content,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.pageable,
    required this.first,
    required this.last,
    required this.empty,
  });

  factory ShareAllPostResponse.fromJson(Map<String, dynamic> json) {
    return ShareAllPostResponse(
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      size: json['size'],
      content: (json['content'] as List)
          .map((item) {
        print("🔍 content item: $item"); // ✅ 여기에 추가
        return SharePostResponse.fromJson(item);
      })
          .toList(),
      number: json['number'],
      sort: (json['sort'] as List)
          .map((e) => Sort.fromJson(e))
          .toList(),
      numberOfElements: json['numberOfElements'],
      pageable: Pageable.fromJson(json['pageable']),
      first: json['first'],
      last: json['last'],
      empty: json['empty'],
    );
  }
}

class Sort {
  final String direction;
  final String property;
  final bool ignoreCase;
  final String nullHandling;
  final bool ascending;
  final bool descending;

  Sort({
    required this.direction,
    required this.property,
    required this.ignoreCase,
    required this.nullHandling,
    required this.ascending,
    required this.descending,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      direction: json['direction'],
      property: json['property'],
      ignoreCase: json['ignoreCase'],
      nullHandling: json['nullHandling'],
      ascending: json['ascending'],
      descending: json['descending'],
    );
  }
}

class Pageable {
  final int offset;
  final List<Sort> sort;
  final bool unpaged;
  final bool paged;
  final int pageNumber;
  final int pageSize;

  Pageable({
    required this.offset,
    required this.sort,
    required this.unpaged,
    required this.paged,
    required this.pageNumber,
    required this.pageSize,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      offset: json['offset'],
      sort: (json['sort'] as List)
          .map((e) => Sort.fromJson(e))
          .toList(),
      unpaged: json['unpaged'],
      paged: json['paged'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
    );
  }
}
