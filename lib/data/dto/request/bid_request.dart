class BidRequest {
  final String content;
  final int donation;

  BidRequest({required this.content, required this.donation});

  Map<String, dynamic> toJson() => {
    'content': content,
    'donation': donation,
  };
}