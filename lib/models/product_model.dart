class Product {
  final String id;
  final String title;
  final String location;
  final String timeAgo;
  final String imageUrl;
  final int comments;
  final int likes;
  final bool isFree;

  Product({
    required this.id,
    required this.title,
    required this.location,
    required this.timeAgo,
    required this.imageUrl,
    this.comments = 0,
    this.likes = 0,
    this.isFree = false,
  });

  // JSON 데이터를 모델로 변환하는 메서드
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'],
      location: json['location'],
      timeAgo: json['timeAgo'],
      imageUrl: json['imageUrl'],
      comments: json['comments'] ?? 0,
      likes: json['likes'] ?? 0,
      isFree: json['isFree'] ?? false,
    );
  }
}
