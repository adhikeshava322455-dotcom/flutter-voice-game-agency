class Game {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final int minPlayers;
  final int maxPlayers;
  final int coinsReward;
  final int diamondsReward;
  final int duration; // in seconds
  final List<String> rules;
  final bool requiresVoiceChat;
  final double rating;

  Game({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.minPlayers,
    required this.maxPlayers,
    required this.coinsReward,
    required this.diamondsReward,
    required this.duration,
    required this.rules,
    required this.requiresVoiceChat,
    required this.rating,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      minPlayers: json['minPlayers'] ?? 2,
      maxPlayers: json['maxPlayers'] ?? 10,
      coinsReward: json['coinsReward'] ?? 100,
      diamondsReward: json['diamondsReward'] ?? 5,
      duration: json['duration'] ?? 300,
      rules: List<String>.from(json['rules'] ?? []),
      requiresVoiceChat: json['requiresVoiceChat'] ?? false,
      rating: (json['rating'] ?? 4.5).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'minPlayers': minPlayers,
      'maxPlayers': maxPlayers,
      'coinsReward': coinsReward,
      'diamondsReward': diamondsReward,
      'duration': duration,
      'rules': rules,
      'requiresVoiceChat': requiresVoiceChat,
      'rating': rating,
    };
  }
}
