class Agency {
  final String id;
  final String name;
  final String description;
  final String ownerId;
  final String ownerName;
  final String logo;
  final String banner;
  final List<String> managerIds;
  final List<String> memberIds;
  final int totalCoins;
  final int totalDiamonds;
  final DateTime createdAt;
  final Map<String, dynamic> settings;

  Agency({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.ownerName,
    required this.logo,
    required this.banner,
    required this.managerIds,
    required this.memberIds,
    required this.totalCoins,
    required this.totalDiamonds,
    required this.createdAt,
    required this.settings,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      ownerId: json['ownerId'] ?? '',
      ownerName: json['ownerName'] ?? '',
      logo: json['logo'] ?? '',
      banner: json['banner'] ?? '',
      managerIds: List<String>.from(json['managerIds'] ?? []),
      memberIds: List<String>.from(json['memberIds'] ?? []),
      totalCoins: json['totalCoins'] ?? 0,
      totalDiamonds: json['totalDiamonds'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      settings: json['settings'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'logo': logo,
      'banner': banner,
      'managerIds': managerIds,
      'memberIds': memberIds,
      'totalCoins': totalCoins,
      'totalDiamonds': totalDiamonds,
      'createdAt': createdAt.toIso8601String(),
      'settings': settings,
    };
  }

  int get totalMembers => memberIds.length + managerIds.length;
}
