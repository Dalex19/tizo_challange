import 'package:tizo_challange/features/feed/data/post_model.dart';
import 'package:tizo_challange/shared/api/api_service.dart';

class PostServices extends ApiService {
  Future<List<PostModel>> getPosts({int page = 1}) async {
    try {
      final response = await getRequest(
        "posts",
        queryParameters: {
          '_limit': 10,
          '_page': page,
        },
      );

      final List<dynamic> responseData = response.data;

      final List<PostModel> allPosts =
          responseData.map((item) => PostModel.fromJson(item)).toList();
      return allPosts;
    } catch (e) {
      throw Exception("Error al obtener los posts");
    }
  }
}
