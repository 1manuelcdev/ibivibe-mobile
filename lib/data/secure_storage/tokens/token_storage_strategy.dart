import 'package:ibiapabaapp/data/secure_storage/tokens/entities/token_response.dart';

abstract class TokenStorageStrategy {
  Future<void> saveTokens(TokenResponse response) async {
    throw UnimplementedError();
  }

  Future<String?> getAccessToken() async {
    throw UnimplementedError();
  }

  Future<String?> getRefreshToken() async {
    throw UnimplementedError();
  }

  Future<void> clearTokens() async {
    throw UnimplementedError();
  }
}
