import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _obscurePassword = true;
  bool _isLoading = false;

  bool get obscurePassword => _obscurePassword;
  bool get isLoading => _isLoading;

  
  void togglePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  
  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }


  void stopLoading() {
    _isLoading = false;
    notifyListeners();
  }
}