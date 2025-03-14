class ProductDetail {
  final int id;
  final int userId;
  final String title;
  final String category;
  final String content;
  final List<String> images;
  final String type;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likeCount;
  final bool isLiked;

  ProductDetail({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.content,
    required this.images,
    required this.type,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.likeCount,
    required this.isLiked,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      category: json['category'],
      content: json['content'],
      images: List<String>.from(json['images']),
      type: json['type'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      likeCount: json['likeCount'],
      isLiked: json['isLiked'],
    );
  }
}
