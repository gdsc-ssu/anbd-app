import 'share_post_response.dart';

class ShareAllPostResponse {
  final int totalPages;
  final int totalElements;
  final int size;
  final List<SharePostResponse> content;
  final int number;
  final Sort sort;
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
          .map((item) => SharePostResponse.fromJson(item))
          .toList(),
      number: json['number'],
      sort: Sort.fromJson(json['sort']),
      numberOfElements: json['numberOfElements'],
      pageable: Pageable.fromJson(json['pageable']),
      first: json['first'],
      last: json['last'],
      empty: json['empty'],
    );
  }
}

class Sort {
  final bool empty;
  final bool unsorted;
  final bool sorted;

  Sort({
    required this.empty,
    required this.unsorted,
    required this.sorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      empty: json['empty'],
      unsorted: json['unsorted'],
      sorted: json['sorted'],
    );
  }
}

class Pageable {
  final int offset;
  final Sort sort;
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
      sort: Sort.fromJson(json['sort']),
      unpaged: json['unpaged'],
      paged: json['paged'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
    );
  }
}
