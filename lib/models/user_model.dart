class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final String phone;
  final int coins;
  final int diamonds;
  final int level;
  final String agencyId;
  final String role; // admin, manager, player
  final DateTime createdAt;
  final DateTime updatedAt;
  final Map<String, dynamic> stats;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.phone,
    required this.coins,
    required this.diamonds,
    required this.level,
    required this.agencyId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.stats,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
      phone: json['phone'] ?? '',
      coins: json['coins'] ?? 0,
      diamonds: json['diamonds'] ?? 0,
      level: json['level'] ?? 1,
      agencyId: json['agencyId'] ?? '',
      role: json['role'] ?? 'player',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
      stats: json['stats'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'phone': phone,
      'coins': coins,
      'diamonds': diamonds,
      'level': level,
      'agencyId': agencyId,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'stats': stats,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    String? phone,
    int? coins,
    int? diamonds,
    int? level,
    String? agencyId,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? stats,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      phone: phone ?? this.phone,
      coins: coins ?? this.coins,
      diamonds: diamonds ?? this.diamonds,
      level: level ?? this.level,
      agencyId: agencyId ?? this.agencyId,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      stats: stats ?? this.stats,
    );
  }
}
