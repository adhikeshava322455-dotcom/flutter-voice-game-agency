import 'package:flutter/material.dart';

class CoinsProvider with ChangeNotifier {
  int _coins = 0;
  int _diamonds = 0;
  int _totalEarned = 0;
  bool _isLoading = false;
  List<Map<String, dynamic>> _transactions = [];

  int get coins => _coins;
  int get diamonds => _diamonds;
  int get totalEarned => _totalEarned;
  bool get isLoading => _isLoading;
  List<Map<String, dynamic>> get transactions => _transactions;

  void addCoins(int amount) {
    _coins += amount;
    _totalEarned += amount;
    _transactions.add({
      'type': 'earned',
      'amount': amount,
      'reason': 'Game Reward',
      'timestamp': DateTime.now(),
    });
    notifyListeners();
  }

  void removeCoins(int amount) {
    if (_coins >= amount) {
      _coins -= amount;
      _transactions.add({
        'type': 'spent',
        'amount': amount,
        'reason': 'Purchase',
        'timestamp': DateTime.now(),
      });
      notifyListeners();
    }
  }

  void addDiamonds(int amount) {
    _diamonds += amount;
    _transactions.add({
      'type': 'earned',
      'amount': amount,
      'currency': 'diamonds',
      'reason': 'Premium Reward',
      'timestamp': DateTime.now(),
    });
    notifyListeners();
  }

  void removeDiamonds(int amount) {
    if (_diamonds >= amount) {
      _diamonds -= amount;
      _transactions.add({
        'type': 'spent',
        'amount': amount,
        'currency': 'diamonds',
        'reason': 'Purchase',
        'timestamp': DateTime.now(),
      });
      notifyListeners();
    }
  }

  Future<void> purchaseCoins(int amount) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Integrate with payment gateway
      await Future.delayed(const Duration(seconds: 2));
      _coins += amount;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCoinsHistory(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(seconds: 1));
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
