import 'package:social_media/Tabs/profile/model/user_profile_model.dart';

import 'base_api_service.dart';

class UserService extends BaseApiService {
  @override
  String setEndPoint() => '/user';
  Future<bool> followUser(String userId) async {
    try {
      final response = await dio.put('/follow/$userId');
      return response.isOk;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<UserProfileModel> getUserInfo(String userId) async {
    try {
      final response = await dio.put('/$userId');
      if (response.isOk) {
        return UserProfileModel.fromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }
}
