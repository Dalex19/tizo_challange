import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/card_post.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/no_more_data.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/progress_indicator.dart';
import 'package:tizo_challange/features/feed/state/post_controller.dart';

import 'package:tizo_challange/features/feed/data/post_model.dart';
import 'package:tizo_challange/features/feed/utils/utils.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  final PostController controller = Get.find<PostController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        controller.fetchPosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Obx(
            () {
              if (controller.isLoading.value && controller.posts.isEmpty) {
                return const MyProgressIndicator();
              }
              return ListView.separated(
                controller: _scrollController,
                itemCount: controller.posts.length + 1,
                itemBuilder: (context, index) {
                  if (index < controller.posts.length) {
                    final PostModel post = controller.posts[index];
                    return CardPost(
                      title: post.title,
                      index: index,
                      description: post.body,
                    );
                  } else {
                    return controller.hasMore.value
                        ? const MyProgressIndicator()
                        : NoMoreData(
                            scrollToTop: () => scrollToTop(_scrollController),
                          );
                  }
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              );
            },
          ),
        ),
      ),
    );
  }
}
