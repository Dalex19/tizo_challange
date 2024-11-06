import 'package:get/get.dart';
import 'package:tizo_challange/features/feed/data/services/comments_services.dart';
import 'package:tizo_challange/features/feed/data/models/comments_model.dart';

class CommentController extends GetxController {
  
  final CommentsServices _commentsServices = CommentsServices();

  var comments = <CommentsModel>[].obs;
  var isLoading = true.obs;

  Future<void> fetchComments(int postId) async {
    try {
      isLoading.value = true;
      final response = await _commentsServices.getComments(postId);
      comments.addAll(response);
    } catch (e) {
      Get.snackbar("Error", "No se pudieron cargar los comentarios");
    } finally {
      isLoading.value = false;
    }
  }
}
