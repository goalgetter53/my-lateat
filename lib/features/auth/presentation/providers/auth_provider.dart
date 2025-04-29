import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  User? _currentUser;
  bool _isLoading = false;

  AuthProvider() : _authRepository = AuthRepository() {
    _initialize();
  }

  bool get isLoading => _isLoading;
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  Future<void> _initialize() async {
    _isLoading = true;
    notifyListeners();

    await _authRepository.initialize();
    _currentUser = await _authRepository.getCurrentUser();

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        _currentUser = user;
        notifyListeners();
        return true;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    await _authRepository.signOut();
    _currentUser = null;

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateUserCountry(String country) async {
    if (_currentUser?.uid != null) {
      await _authRepository.updateUserCountry(_currentUser!.uid!, country);
      _currentUser = _currentUser!.copyWith(selectedCountry: country);
      notifyListeners();
    }
  }
}