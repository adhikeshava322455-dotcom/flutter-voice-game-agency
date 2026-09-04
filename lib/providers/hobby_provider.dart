import 'package:flutter/material.dart';
import '../models/hobby_model.dart';
import '../models/hobby_post_model.dart';
import '../models/hobby_challenge_model.dart';
import '../models/hobby_event_model.dart';
import '../models/hobby_group_model.dart';

class HobbyProvider with ChangeNotifier {
  List<Hobby> _hobbiesList = [];
  Hobby? _selectedHobby;
  List<HobbyPost> _hobbyPosts = [];
  List<HobbyChallenge> _challenges = [];
  List<HobbyEvent> _events = [];
  List<HobbyGroup> _groups = [];
  bool _isLoading = false;
  String? _errorMessage;
  List<Hobby> _followedHobbies = [];

  List<Hobby> get hobbiesList => _hobbiesList;
  Hobby? get selectedHobby => _selectedHobby;
  List<HobbyPost> get hobbyPosts => _hobbyPosts;
  List<HobbyChallenge> get challenges => _challenges;
  List<HobbyEvent> get events => _events;
  List<HobbyGroup> get groups => _groups;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Hobby> get followedHobbies => _followedHobbies;

  Future<void> fetchAllHobbies() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(seconds: 1));
      _hobbiesList = [
        Hobby(
          id: 'hobby_1',
          title: 'Photography',
          description: 'Share your best photos and learn photography tips',
          category: 'Arts & Creativity',
          imageUrl: '',
          tags: ['photography', 'art', 'creative'],
          creatorId: 'user_1',
          creatorName: 'John Doe',
          followers: 1250,
          posts: 450,
          rating: 4.7,
          createdAt: DateTime.now().subtract(const Duration(days: 180)),
          memberIds: [],
          isPublic: true,
          coinsReward: 50,
        ),
        Hobby(
          id: 'hobby_2',
          title: 'Gaming',
          description: 'Discuss games, strategies, and gaming experiences',
          category: 'Entertainment',
          imageUrl: '',
          tags: ['gaming', 'video games', 'esports'],
          creatorId: 'user_2',
          creatorName: 'Jane Smith',
          followers: 2500,
          posts: 890,
          rating: 4.8,
          createdAt: DateTime.now().subtract(const Duration(days: 270)),
          memberIds: [],
          isPublic: true,
          coinsReward: 100,
        ),
      ];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> selectHobby(String hobbyId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedHobby = _hobbiesList.firstWhere((h) => h.id == hobbyId);
      await fetchHobbyPosts(hobbyId);
      await fetchHobbyChallenges(hobbyId);
      await fetchHobbyEvents(hobbyId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createHobby(String title, String description, String category, List<String> tags) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Create in Firebase
      await Future.delayed(const Duration(seconds: 1));
      final newHobby = Hobby(
        id: 'hobby_${DateTime.now().millisecondsSinceEpoch}',
        title: title,
        description: description,
        category: category,
        imageUrl: '',
        tags: tags,
        creatorId: 'user_123',
        creatorName: 'Current User',
        followers: 0,
        posts: 0,
        rating: 5.0,
        createdAt: DateTime.now(),
        memberIds: ['user_123'],
        isPublic: true,
        coinsReward: 50,
      );
      _hobbiesList.add(newHobby);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> followHobby(String hobbyId) async {
    try {
      final hobby = _hobbiesList.firstWhere((h) => h.id == hobbyId);
      if (!_followedHobbies.contains(hobby)) {
        _followedHobbies.add(hobby);
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> unfollowHobby(String hobbyId) async {
    try {
      _followedHobbies.removeWhere((h) => h.id == hobbyId);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchHobbyPosts(String hobbyId) async {
    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(milliseconds: 500));
      _hobbyPosts = [];
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> createHobbyPost(String hobbyId, String content, List<String> imageUrls) async {
    try {
      // TODO: Create in Firebase
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchHobbyChallenges(String hobbyId) async {
    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(milliseconds: 500));
      _challenges = [];
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> joinChallenge(String challengeId, String userId) async {
    try {
      // TODO: Join in Firebase
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchHobbyEvents(String hobbyId) async {
    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(milliseconds: 500));
      _events = [];
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> registerForEvent(String eventId, String userId) async {
    try {
      // TODO: Register in Firebase
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchHobbyGroups(String hobbyId) async {
    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(milliseconds: 500));
      _groups = [];
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> joinGroup(String groupId, String userId) async {
    try {
      // TODO: Join in Firebase
      await Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
