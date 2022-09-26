import 'dart:developer';

import 'package:dio/dio.dart';

handleError(e) {
  if (e is DioError) {
    if (e.response == null) {
      return networkError;
    }
    if (e.message.startsWith('SocketException')) {
      log('network');
      return networkError;
    }
    if (e.response?.data is Map && e.response!.data['error'] != null) {
      return e.response!.data['error'];
    }
    log(e.response!.data!.toString());
    log('out');
    return defaultApiError;
  }
  return e.toString();
}

String defaultApiError = 'Something went wrong!';
String networkError = 'No connection';

extension ApiInt on int {
  int get statusType => (this / 100).floor() * 100;
}
