import 'package:dio/dio.dart';
import 'package:social_media/functions/api_functions.dart';

import '../constants/api_urls.dart';
import '../screens/authentication/providers/auth_provider.dart';

class UserService {
  Dio dio = Dio();
  UserService() {
    init();
  }
  init() {
    dio.options.headers['authtoken'] = AuthProvider.currUser!.token;
    dio.options.baseUrl = '${ApiUri.baseUrl}user';
  }

  Future<bool> followUser(String userId) async {
    try {
      final response = await dio.put('/follow/$userId');
      return response.statusCode!.statusType == 200;
    } catch (e) {
      throw handleError(e);
    }
  }
}
