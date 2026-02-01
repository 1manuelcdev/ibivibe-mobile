import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmail {
  final AuthRepository repository;

  RegisterWithEmail(this.repository);

  Future<void> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repository.registerWithEmail(
      name: name,
      email: email,
      password: password,
    );
  }
}
