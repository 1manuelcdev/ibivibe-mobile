import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class LoginWithEmail {
  final AuthRepository repository;

  LoginWithEmail(this.repository);

  Future<void> call(String email, String password) {
    return repository.loginWithEmail(email: email, password: password);
  }
}
