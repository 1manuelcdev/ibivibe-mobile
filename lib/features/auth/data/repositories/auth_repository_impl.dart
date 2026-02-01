import 'package:ibiapabaapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ibiapabaapp/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) {
    return datasource.login(email: email, password: password);
  }

  @override
  Future<void> registerWithEmail({
    required String name,
    required String email,
    required String password,
  }) {
    return datasource.register(name: name, email: email, password: password);
  }
}
