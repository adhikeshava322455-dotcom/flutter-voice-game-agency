class HobbyChallenge {
  final String id;
  final String hobbyId;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final int participantCount;
  final String imageUrl;
  final int prizeCoins;
  final int prizeDiamonds;
  final List<String> rules;
  final bool isActive;
  final String difficulty; // easy, medium, hard
  final int maxParticipants;
  final List<String> participantIds;

  HobbyChallenge({
    required this.id,
    required this.hobbyId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.participantCount,
    required this.imageUrl,
    required this.prizeCoins,
    required this.prizeDiamonds,
    required this.rules,
    required this.isActive,
    required this.difficulty,
    required this.maxParticipants,
    required this.participantIds,
  });

  factory HobbyChallenge.fromJson(Map<String, dynamic> json) {
    return HobbyChallenge(
      id: json['id'] ?? '',
      hobbyId: json['hobbyId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      startDate: DateTime.parse(json['startDate'] ?? DateTime.now().toIso8601String()),
      endDate: DateTime.parse(json['endDate'] ?? DateTime.now().toIso8601String()),
      participantCount: json['participantCount'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      prizeCoins: json['prizeCoins'] ?? 500,
      prizeDiamonds: json['prizeDiamonds'] ?? 25,
      rules: List<String>.from(json['rules'] ?? []),
      isActive: json['isActive'] ?? true,
      difficulty: json['difficulty'] ?? 'medium',
      maxParticipants: json['maxParticipants'] ?? 100,
      participantIds: List<String>.from(json['participantIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hobbyId': hobbyId,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'participantCount': participantCount,
      'imageUrl': imageUrl,
      'prizeCoins': prizeCoins,
      'prizeDiamonds': prizeDiamonds,
      'rules': rules,
      'isActive': isActive,
      'difficulty': difficulty,
      'maxParticipants': maxParticipants,
      'participantIds': participantIds,
    };
  }

  bool get isEnded => DateTime.now().isAfter(endDate);
  int get daysRemaining => endDate.difference(DateTime.now()).inDays;
}
