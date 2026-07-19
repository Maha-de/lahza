import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String subscriptionStatusKey = 'subscription_status';

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: accessTokenKey, value: token);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: refreshTokenKey, value: token);
  }

  Future<void> saveSubscriptionStatus(String status) async {
    await _storage.write(key: subscriptionStatusKey, value: status);
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return _storage.read(key: refreshTokenKey);
  }

  Future<String?> getSubscriptionStatus() async {
    return _storage.read(key: subscriptionStatusKey);
  }

  Future<void> removeAccessToken() async {
    await _storage.delete(key: accessTokenKey);
  }

  Future<void> removeRefreshToken() async {
    await _storage.delete(key: refreshTokenKey);
  }

  Future<void> removeSubscriptionStatus() async {
    await _storage.delete(key: subscriptionStatusKey);
  }

  Future<void> removeTokens() async {
    await Future.wait([
      _storage.delete(key: accessTokenKey),
      _storage.delete(key: refreshTokenKey),
      _storage.delete(key: subscriptionStatusKey),
    ]);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}