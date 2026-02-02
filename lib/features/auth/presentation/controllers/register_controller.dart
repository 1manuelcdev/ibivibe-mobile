import 'package:flutter/material.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/register_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/states/register_state.dart';

class RegisterController extends ChangeNotifier {
  final RegisterWithEmail registerWithEmail;

  RegisterController(this.registerWithEmail);

  RegisterState _state = RegisterInitial();
  RegisterState get state => _state;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _state = RegisterLoading();
    notifyListeners();

    try {
      await registerWithEmail(
        name: name.trim(),
        email: email.trim(),
        password: password,
      );
      _state = RegisterSuccess();
    } catch (e) {
      _state = RegisterError(e.toString());
    }

    notifyListeners();
  }
}
