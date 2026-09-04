import 'package:flutter/material.dart';
import '../models/voice_room_model.dart';

class VoiceProvider with ChangeNotifier {
  VoiceRoom? _currentRoom;
  List<VoiceRoom> _availableRooms = [];
  bool _isMicrophoneOn = false;
  bool _isConnected = false;
  bool _isLoading = false;
  String? _errorMessage;
  List<String> _participants = [];

  VoiceRoom? get currentRoom => _currentRoom;
  List<VoiceRoom> get availableRooms => _availableRooms;
  bool get isMicrophoneOn => _isMicrophoneOn;
  bool get isConnected => _isConnected;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<String> get participants => _participants;

  Future<void> fetchAvailableRooms() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Fetch from Firebase/Agora
      await Future.delayed(const Duration(seconds: 1));
      _availableRooms = [];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createVoiceRoom(String name, String description, int maxParticipants) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Create in Agora and Firebase
      await Future.delayed(const Duration(seconds: 1));
      _currentRoom = VoiceRoom(
        id: 'room_123',
        name: name,
        description: description,
        hostId: 'user_123',
        hostName: 'Host Name',
        maxParticipants: maxParticipants,
        participantIds: ['user_123'],
        status: 'active',
        createdAt: DateTime.now(),
        coinsPerMinute: 10,
        gameType: 'none',
        isPublic: true,
      );
      _isConnected = true;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> joinVoiceRoom(String roomId, String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: Join Agora channel
      await Future.delayed(const Duration(seconds: 1));
      _isConnected = true;
      if (!_participants.contains(userId)) {
        _participants.add(userId);
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> leaveVoiceRoom() async {
    try {
      // TODO: Leave Agora channel
      _isConnected = false;
      _currentRoom = null;
      _participants.clear();
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void toggleMicrophone() {
    _isMicrophoneOn = !_isMicrophoneOn;
    notifyListeners();
  }
}
