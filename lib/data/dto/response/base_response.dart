class BaseResponse<T> {
  final String traceId;
  final int status;
  final String code;
  final String timestamp;
  final T body;

  BaseResponse({
    required this.traceId,
    required this.status,
    required this.code,
    required this.timestamp,
    required this.body,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    final bodyJson = json['body'];

    if (bodyJson == null) {
      throw Exception('BaseResponse Error: body가 null입니다.');
    }

    return BaseResponse(
      traceId: json['traceId'] as String? ?? '',
      status: json['status'] as int? ?? -1,
      code: json['code'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
      body: fromJsonT(bodyJson),
    );
  }
}
