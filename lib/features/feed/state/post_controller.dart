import 'package:get/get.dart';

import 'package:tizo_challange/features/feed/data/services/post_services.dart';

class PostController extends GetxController {
  final PostServices _postServices = PostServices();
  var posts = <dynamic>[].obs;
  var isLoading = true.obs;
  var isFetchingMore = false.obs;
  var hasMore = true.obs;
  var page = 1;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final response = await _postServices.getPosts(page: page);

      if (response.isEmpty) {
        hasMore.value = false;
      } else {
        hasMore.value = true;
        posts.addAll(response);
        page++;
      }
    } catch (e) {
      Get.snackbar("Error", "No se pudieron cargar los posts");
    } finally {
      isLoading.value = false;
    }
  }


}