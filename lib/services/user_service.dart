import 'dart:convert';
import 'dart:developer';

import 'package:social_media/Tabs/profile/model/user_profile_model.dart';

import 'base_api_service.dart';

class UserService extends BaseApiService {
  @override
  String setEndPoint() => '/user';
  Future<bool> followUser(String userId) async {
    try {
      final response =
          await dio.put('/follow/$userId', data: {"userId": currUser!.id});
      if (response.isOk) {
        log(response.data.toString());
        if (response.data['message'] == 'User Followed') {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<UserProfileModel> getUserInfo(String userId) async {
    try {
      final response = await dio.get('/$userId');
      if (response.isOk) {
        return UserProfileModel.fromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<List<UserDetails>> getSuggestions() async {
    try {
      final response = await dio.get('/suggestion/${currUser!.id}');
      if (response.isOk) {
        return usersListFromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<List<UserDetails>> getUsersDetails(List<String> userIds) async {
    try {
      final response = await dio.post('/userDetails',
          data: jsonEncode({"userIds", userIds}));
      log(response.data.toString());
      if (response.isOk) {
        return usersListFromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }
}
