import 'dart:developer';

import 'package:http_parser/http_parser.dart';

import '../models/postmodel.dart';
import '../screens/post/models/imagepostmodel.dart';
import 'base_api_service.dart';

class PostService extends BaseApiService {
  @override
  String setEndPoint() => '/post';
  Future<String> postImage(ImagePostModel post) async {
    try {
      String fileName = post.file.split('/').last;
      String format = fileName.split('.').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(post.file,
            filename: fileName, contentType: MediaType('image', format)),
        "caption": post.caption,
        'userId': post.userId
      });
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      var response = await dio.post('', data: formData);
      if (response.isOk) {
        log(response.data['message']);
        return response.data['message'];
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      log(e.toString());

      throw handleError(e);
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get('/timeline/${currUser!.id}');

      if (response.isOk) {
        return postsFromJson(response.data);
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<void> likePost(String postId) async {
    try {
      final response =
          await dio.put('/like/$postId', data: {'userId': currUser!.id});
      log(response.data['message']);
    } catch (e) {
      throw handleError(e);
    }
  }

  Future reportPost(String postId) async {
    try {
      final response = await dio.post('/reportPost/$postId');
      if (response.isOk) {
        return true;
      }
      return false;
    } catch (e) {
      throw handleError(e);
    }
  }
}
