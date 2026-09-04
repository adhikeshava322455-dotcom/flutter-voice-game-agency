import 'package:flutter/material.dart';
import '../models/agency_model.dart';

class AgencyProvider with ChangeNotifier {
  Agency? _currentAgency;
  List<Agency> _agenciesList = [];
  bool _isLoading = false;
  String? _errorMessage;

  Agency? get currentAgency => _currentAgency;
  List<Agency> get agenciesList => _agenciesList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> createAgency(String name, String description, String ownerId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // TODO: Create in Firebase
      await Future.delayed(const Duration(seconds: 1));
      _currentAgency = Agency(
        id: 'agency_123',
        name: name,
        description: description,
        ownerId: ownerId,
        ownerName: 'Owner Name',
        logo: '',
        banner: '',
        managerIds: [],
        memberIds: [],
        totalCoins: 0,
        totalDiamonds: 0,
        createdAt: DateTime.now(),
        settings: {},
      );
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAgencyDetails(String agencyId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Fetch from Firebase
      await Future.delayed(const Duration(seconds: 1));
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addMemberToAgency(String agencyId, String userId) async {
    try {
      // TODO: Add to Firebase
      if (_currentAgency != null) {
        _currentAgency!.memberIds.add(userId);
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeMemberFromAgency(String agencyId, String userId) async {
    try {
      // TODO: Remove from Firebase
      if (_currentAgency != null) {
        _currentAgency!.memberIds.remove(userId);
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
