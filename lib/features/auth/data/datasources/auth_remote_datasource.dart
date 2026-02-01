import 'package:ibiapabaapp/core/services/api_service.dart';

class AuthRemoteDatasource {
  final ApiService api;

  AuthRemoteDatasource(this.api);

  Future<void> login({required String email, required String password}) {
    return api.login(email: email, password: password);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) {
    return api.register(name: name, email: email, password: password);
  }
}
