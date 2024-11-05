import 'package:get/get.dart';
import 'package:tizo_challange/features/feed/state/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
  }
}