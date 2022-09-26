import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  AndroidOptions secureOption() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static Future<String> getToken() async =>
      await const FlutterSecureStorage().read(key: 'user.token') ?? '';
}
