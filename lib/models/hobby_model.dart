class Hobby {
  final String id;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final List<String> tags;
  final String creatorId;
  final String creatorName;
  final int followers;
  final int posts;
  final double rating;
  final DateTime createdAt;
  final List<String> memberIds;
  final bool isPublic;
  final int coinsReward;

  Hobby({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.tags,
    required this.creatorId,
    required this.creatorName,
    required this.followers,
    required this.posts,
    required this.rating,
    required this.createdAt,
    required this.memberIds,
    required this.isPublic,
    required this.coinsReward,
  });

  factory Hobby.fromJson(Map<String, dynamic> json) {
    return Hobby(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      creatorId: json['creatorId'] ?? '',
      creatorName: json['creatorName'] ?? '',
      followers: json['followers'] ?? 0,
      posts: json['posts'] ?? 0,
      rating: (json['rating'] ?? 4.5).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      memberIds: List<String>.from(json['memberIds'] ?? []),
      isPublic: json['isPublic'] ?? true,
      coinsReward: json['coinsReward'] ?? 50,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'tags': tags,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'followers': followers,
      'posts': posts,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'memberIds': memberIds,
      'isPublic': isPublic,
      'coinsReward': coinsReward,
    };
  }
}
