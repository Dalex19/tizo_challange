import 'package:get/get.dart';
import 'package:tizo_challange/features/connection_check/network_service.dart';

import 'package:tizo_challange/features/feed/data/services/post_services.dart';

class PostController extends GetxController {
  final PostServices _postServices = PostServices();
  final NetworkService _networkService = Get.find<NetworkService>();

  var posts = <dynamic>[].obs;
  var isLoading = true.obs;
  var isFetchingMore = false.obs;
  var hasMore = true.obs;
  var page = 1;

  @override
  void onInit() {
    super.onInit();
    //Se ejecuta solo una vez
    fetchPosts();

    //Se ejecuta, solo si detecta cambios
    ever(_networkService.isConnected, (bool? isConnected) {
      if (isConnected == true) {
        fetchPosts();
      }
    });
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
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
