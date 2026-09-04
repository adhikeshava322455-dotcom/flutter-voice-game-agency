import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;
  List<User> _usersList = [];

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<User> get usersList => _usersList;

  Future<void> fetchCurrentUser(String userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = User(
        id: userId,
        name: 'John Doe',
        email: 'john@example.com',
        profileImage: '',
        phone: '+1234567890',
        coins: 5000,
        diamonds: 50,
        level: 5,
        agencyId: 'agency_123',
        role: 'player',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        stats: {'gamesPlayed': 50, 'wins': 25, 'rating': 4.5},
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserProfile(User user) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Update in Firebase
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = user;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUsersList(String agencyId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(seconds: 1));
      _usersList = [];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
