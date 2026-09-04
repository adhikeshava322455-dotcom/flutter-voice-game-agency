class HobbyEvent {
  final String id;
  final String hobbyId;
  final String title;
  final String description;
  final DateTime eventDate;
  final String location;
  final String eventType; // online, offline, hybrid
  final int attendeeCount;
  final int capacity;
  final String creatorId;
  final String creatorName;
  final String imageUrl;
  final int coinsReward;
  final List<String> attendeeIds;
  final bool isRegistered;

  HobbyEvent({
    required this.id,
    required this.hobbyId,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.location,
    required this.eventType,
    required this.attendeeCount,
    required this.capacity,
    required this.creatorId,
    required this.creatorName,
    required this.imageUrl,
    required this.coinsReward,
    required this.attendeeIds,
    required this.isRegistered,
  });

  factory HobbyEvent.fromJson(Map<String, dynamic> json) {
    return HobbyEvent(
      id: json['id'] ?? '',
      hobbyId: json['hobbyId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      eventDate: DateTime.parse(json['eventDate'] ?? DateTime.now().toIso8601String()),
      location: json['location'] ?? '',
      eventType: json['eventType'] ?? 'online',
      attendeeCount: json['attendeeCount'] ?? 0,
      capacity: json['capacity'] ?? 100,
      creatorId: json['creatorId'] ?? '',
      creatorName: json['creatorName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      coinsReward: json['coinsReward'] ?? 100,
      attendeeIds: List<String>.from(json['attendeeIds'] ?? []),
      isRegistered: json['isRegistered'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hobbyId': hobbyId,
      'title': title,
      'description': description,
      'eventDate': eventDate.toIso8601String(),
      'location': location,
      'eventType': eventType,
      'attendeeCount': attendeeCount,
      'capacity': capacity,
      'creatorId': creatorId,
      'creatorName': creatorName,
      'imageUrl': imageUrl,
      'coinsReward': coinsReward,
      'attendeeIds': attendeeIds,
      'isRegistered': isRegistered,
    };
  }

  bool get isFull => attendeeCount >= capacity;
  bool get isPassed => DateTime.now().isAfter(eventDate);
}
