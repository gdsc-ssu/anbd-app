class SharePostResponse {
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

  SharePostResponse({
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

  factory SharePostResponse.fromJson(Map<String, dynamic> json) => SharePostResponse(
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'category': category,
    'content': content,
    'images': images,
    'type': type,
    'description': description,
    'location': location,
    'isSold': isSold,
    'hits': hits,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
    'likeCount': likeCount,
    'isLiked': isLiked,
  };
}
