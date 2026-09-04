class HobbyPost {
  final String id;
  final String hobbyId;
  final String userId;
  final String userName;
  final String userProfileImage;
  final String content;
  final List<String> imageUrls;
  final int likes;
  final int comments;
  final int shares;
  final DateTime createdAt;
  final List<String> tags;
  final bool isVideo;
  final String? videoUrl;
  final int coinsReward;

  HobbyPost({
    required this.id,
    required this.hobbyId,
    required this.userId,
    required this.userName,
    required this.userProfileImage,
    required this.content,
    required this.imageUrls,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.createdAt,
    required this.tags,
    required this.isVideo,
    this.videoUrl,
    required this.coinsReward,
  });

  factory HobbyPost.fromJson(Map<String, dynamic> json) {
    return HobbyPost(
      id: json['id'] ?? '',
      hobbyId: json['hobbyId'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userProfileImage: json['userProfileImage'] ?? '',
      content: json['content'] ?? '',
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      shares: json['shares'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      tags: List<String>.from(json['tags'] ?? []),
      isVideo: json['isVideo'] ?? false,
      videoUrl: json['videoUrl'],
      coinsReward: json['coinsReward'] ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hobbyId': hobbyId,
      'userId': userId,
      'userName': userName,
      'userProfileImage': userProfileImage,
      'content': content,
      'imageUrls': imageUrls,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'createdAt': createdAt.toIso8601String(),
      'tags': tags,
      'isVideo': isVideo,
      'videoUrl': videoUrl,
      'coinsReward': coinsReward,
    };
  }
}
