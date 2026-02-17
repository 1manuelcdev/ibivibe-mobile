import 'package:flutter/material.dart';
import 'package:ibiapabaapp/core/logger/log_tags.dart';
import 'package:ibiapabaapp/core/logger/logger.dart';
import 'package:ibiapabaapp/features/auth/domain/usecases/login_with_email.dart';
import 'package:ibiapabaapp/features/auth/presentation/providers/session_provider.dart';
import 'package:ibiapabaapp/features/auth/presentation/states/login_state.dart';

class LoginController extends ChangeNotifier {
  final LoginWithEmail loginWithEmail;
  final Session session;

  LoginController(this.loginWithEmail, this.session);

  LoginState _state = LoginInitial();
  LoginState get state => _state;

  Future<void> login({required String email, required String password}) async {
    _state = LoginLoading();
    notifyListeners();

    final result = await loginWithEmail(email.trim(), password);
    result.fold(
      (failure) {
        logger.w(
          '${LogTags.controller}${LogTags.login}',
          error: {
            'failure': failure.runtimeType.toString(),
            'code': failure.code,
            'message': failure.message,
          },
        );

        _state = LoginError(failure.message);
      },
      (authResult) {
        logger.i('${LogTags.controller}${LogTags.login}${LogTags.success}');
        session.initSession(authResult);
        _state = LoginSuccess();
      },
    );

    notifyListeners();
  }
}
