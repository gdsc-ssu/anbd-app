import 'package:anbd/data/dto/response/share_post_response.dart';

/// ❌SharePostResponse로 대체 ❌
class SharePostModel {
  final int id;
  final int userId;
  final String title;
  final String category;
  final String content;
  final List<String> images;
  final String type;
  final String description;
  final String location;
  final bool isSold;
  final int hits;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int likeCount;
  final bool isLiked;

  SharePostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.content,
    required this.images,
    required this.type,
    required this.description,
    required this.location,
    required this.isSold,
    required this.hits,
    required this.createdAt,
    required this.updatedAt,
    required this.likeCount,
    required this.isLiked,
  });

  factory SharePostModel.fromJson(Map<String, dynamic> json) {
    return SharePostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      category: json['category'],
      content: json['content'],
      images: List<String>.from(json['images'] ?? []), // ✅ null-safe
      type: json['type'],
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      isSold: json['isSold'] ?? false, // ✅ null-safe boolean
      hits: json['hits'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      likeCount: json['likeCount'] ?? 0,
      isLiked: json['isLiked'] == true,
    );
  }
}
