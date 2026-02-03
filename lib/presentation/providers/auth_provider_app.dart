import 'package:firebase_app/domain/entities/user.dart';
import 'package:firebase_app/domain/repos/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthProviderApp extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProviderApp({required this.authRepository});

  bool isObscure = true;
  bool _isLoading = false;
  User? _currentUser;
  String? _errorMsg;

  bool get isLoading => _isLoading;

  String? get errorMsg => _errorMsg;

  User? get currentUser => _currentUser;

  void toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentUser = await authRepository.login(email, password);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      _errorMsg = e.toString();
      return false;
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await authRepository.logout();
      _currentUser = null;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMsg = e.toString();
      notifyListeners();
    }
  }
}
