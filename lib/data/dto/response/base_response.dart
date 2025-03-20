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
    return BaseResponse(
      traceId: json['traceId'] as String,
      status: json['status'] as int,
      code: json['code'] as String,
      timestamp: json['timestamp'] as String,
      body: fromJsonT(json['body']),
    );
  }
}
