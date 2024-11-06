import 'package:tizo_challange/features/feed/data/models/comments_model.dart';
import 'package:tizo_challange/shared/api/api_service.dart';

class CommentsServices extends ApiService {
  Future<List<CommentsModel>> getComments(int postId) async {
    try {
      final response = await getRequest("comments", queryParameters: {"postId": postId});
      final List<dynamic> responseData = response.data;

      final List<CommentsModel> allComments =
          responseData.map((item) => CommentsModel.fromJson(item)).toList();
      return allComments;
    } catch (e) {
      throw Exception("Error al obtener comentarios");
    }
  }
}
