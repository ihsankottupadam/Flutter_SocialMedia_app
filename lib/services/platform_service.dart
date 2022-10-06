import 'package:flutter/services.dart';

class PlatformService {
  final platform = const MethodChannel('platformChannel');

  Future<List<String>> getRecentImages({required int count}) async {
    try {
      final result = await platform
          .invokeMethod<List>('getRecentImages', {"count": count});
      if (result == null) return [];
      return result.cast<String>();
    } on PlatformException catch (_) {}
    return [];
  }
}
