import 'package:flutter/material.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/login_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/login_state.dart';

class LoginController extends ChangeNotifier {
  final LoginWithEmail loginWithEmail;

  LoginController(this.loginWithEmail);

  LoginState _state = LoginInitial();
  LoginState get state => _state;

  Future<void> login({required String email, required String password}) async {
    _state = LoginLoading();
    notifyListeners();

    try {
      await loginWithEmail(email.trim(), password);
      _state = LoginSuccess();
    } catch (e) {
      _state = LoginError(e.toString());
    }

    notifyListeners();
  }
}
