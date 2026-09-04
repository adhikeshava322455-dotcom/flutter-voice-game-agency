class HobbyGroup {
  final String id;
  final String hobbyId;
  final String name;
  final String description;
  final String adminId;
  final List<String> memberIds;
  final List<String> moderatorIds;
  final String imageUrl;
  final int memberCount;
  final DateTime createdAt;
  final bool isPrivate;
  final List<String> tags;
  final String category;

  HobbyGroup({
    required this.id,
    required this.hobbyId,
    required this.name,
    required this.description,
    required this.adminId,
    required this.memberIds,
    required this.moderatorIds,
    required this.imageUrl,
    required this.memberCount,
    required this.createdAt,
    required this.isPrivate,
    required this.tags,
    required this.category,
  });

  factory HobbyGroup.fromJson(Map<String, dynamic> json) {
    return HobbyGroup(
      id: json['id'] ?? '',
      hobbyId: json['hobbyId'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      adminId: json['adminId'] ?? '',
      memberIds: List<String>.from(json['memberIds'] ?? []),
      moderatorIds: List<String>.from(json['moderatorIds'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
      memberCount: json['memberCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      isPrivate: json['isPrivate'] ?? false,
      tags: List<String>.from(json['tags'] ?? []),
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hobbyId': hobbyId,
      'name': name,
      'description': description,
      'adminId': adminId,
      'memberIds': memberIds,
      'moderatorIds': moderatorIds,
      'imageUrl': imageUrl,
      'memberCount': memberCount,
      'createdAt': createdAt.toIso8601String(),
      'isPrivate': isPrivate,
      'tags': tags,
      'category': category,
    };
  }
}
