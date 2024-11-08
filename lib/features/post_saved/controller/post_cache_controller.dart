import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:tizo_challange/features/post_saved/data/posts_cache.dart';

class PostCacheController extends GetxController {
  var posts = <PostsCache>[].obs;
  var isEmpty = true.obs;
  //var boxHiveGlobal;
  late Box<PostsCache> boxHiveGlobal;

  void _openBox() async {
    boxHiveGlobal = await Hive.openBox<PostsCache>('postsLocal');
    _loadPosts();
  }

  void addNewPost(int id, String title, body) async {
    final PostsCache myPostC = PostsCache(id: id, title: title, body: body);
    await boxHiveGlobal.add(myPostC);
    posts.add(myPostC);
    isEmpty.value = posts.isEmpty;
  }

  void _loadPosts() {
    final savedPosts = boxHiveGlobal.values.toList();
    posts.assignAll(savedPosts);
    isEmpty.value = posts.isEmpty;
  }

  @override
  void onInit() {
    _openBox();
    super.onInit();
  }

  @override
  void onClose() {
    boxHiveGlobal.close();
    super.onClose();
  }
}
