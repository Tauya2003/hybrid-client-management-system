import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _dbKeyKey = 'db_encryption_key';
  static const _deviceIdKey = 'device_id';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  Future<String> getOrCreateDbKey() async {
    final existing = await _storage.read(key: _dbKeyKey);
    if (existing != null && existing.isNotEmpty) return existing;

    // Generate a 32-character random key
    final key = _generateRandomKey();
    await _storage.write(key: _dbKeyKey, value: key);
    return key;
  }

  Future<String> getOrCreateDeviceId() async {
    final existing = await _storage.read(key: _deviceIdKey);
    if (existing != null && existing.isNotEmpty) return existing;

    final id = _generateRandomKey(length: 36).replaceAll(
      RegExp(r'[^a-z0-9]'),
      '-',
    );
    await _storage.write(key: _deviceIdKey, value: id);
    return id;
  }

  String _generateRandomKey({int length = 32}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#\$';
    final random = List.generate(length, (i) {
      final now = DateTime.now().microsecondsSinceEpoch + i;
      return chars[now % chars.length];
    }).join();
    return random;
  }
}
