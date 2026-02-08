import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ibiapabaapp/data/secure_storage/tokens/token_storage_strategy.dart';
import 'package:ibiapabaapp/data/secure_storage/tokens/entities/token_response.dart';

class TokenStorageImpl implements TokenStorageStrategy {
  final _storage = FlutterSecureStorage();

  @override
  Future<void> saveTokens(TokenResponse response) async {
    await _storage.write(key: 'access_token', value: response.accessToken);
    await _storage.write(key: 'refresh_token', value: response.refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token');
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }
}
