import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:social_media/models/postmodel.dart';
import 'package:social_media/screens/authentication/providers/auth_provider.dart';

import '../constants/api_urls.dart';
import '../functions/api_functions.dart';
import '../screens/post/models/imagepostmodel.dart';

class PostService {
  Dio dio = Dio();
  PostService() {
    init();
  }
  init() {
    dio.options.headers['authtoken'] = AuthProvider.currUser!.token;
    dio.options.baseUrl = '${ApiUri.baseUrl}post';
  }

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

      var response =
          await dio.post('${ApiUri.baseUrl}${ApiUri.post}', data: formData);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['message'];
      } else {
        throw defaultApiError;
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get('/timeline/${AuthProvider.currUser!.id}');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
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
      final response = await dio
          .put('/like/$postId', data: {'userId': AuthProvider.currUser!.id});
    } catch (e) {
      throw handleError(e);
    }
  }
}
