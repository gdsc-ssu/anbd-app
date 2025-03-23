import 'package:anbd/data/dto/response/share_post_response.dart';

class Product extends SharePostResponse {
  Product({
    required super.id,
    required super.userId,
    required super.title,
    required super.category,
    required super.content,
    required super.images,
    required super.type,
    required super.description,
    required super.location,
    required super.isSold,
    required super.hits,
    required super.createdAt,
    required super.updatedAt,
    required super.likeCount,
    required super.isLiked,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      category: json['category'],
      content: json['content'],
      images: List<String>.from(json['images']),
      type: json['type'],
      description: json['description'],
      location: json['location'],
      isSold: json['isSold'],
      hits: json['hits'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      likeCount: json['likeCount'],
      isLiked: json['isLiked'],
    );
  }
}
