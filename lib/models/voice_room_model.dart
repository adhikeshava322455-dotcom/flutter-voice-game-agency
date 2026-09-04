class VoiceRoom {
  final String id;
  final String name;
  final String description;
  final String hostId;
  final String hostName;
  final int maxParticipants;
  final List<String> participantIds;
  final String status; // active, inactive, full
  final DateTime createdAt;
  final int coinsPerMinute;
  final String gameType; // optional game type
  final bool isPublic;

  VoiceRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.hostId,
    required this.hostName,
    required this.maxParticipants,
    required this.participantIds,
    required this.status,
    required this.createdAt,
    required this.coinsPerMinute,
    required this.gameType,
    required this.isPublic,
  });

  factory VoiceRoom.fromJson(Map<String, dynamic> json) {
    return VoiceRoom(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      hostId: json['hostId'] ?? '',
      hostName: json['hostName'] ?? '',
      maxParticipants: json['maxParticipants'] ?? 4,
      participantIds: List<String>.from(json['participantIds'] ?? []),
      status: json['status'] ?? 'active',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      coinsPerMinute: json['coinsPerMinute'] ?? 10,
      gameType: json['gameType'] ?? 'none',
      isPublic: json['isPublic'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'hostId': hostId,
      'hostName': hostName,
      'maxParticipants': maxParticipants,
      'participantIds': participantIds,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'coinsPerMinute': coinsPerMinute,
      'gameType': gameType,
      'isPublic': isPublic,
    };
  }

  int get participantCount => participantIds.length;
  bool get isFull => participantCount >= maxParticipants;
}
