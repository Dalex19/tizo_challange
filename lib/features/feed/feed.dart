import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:tizo_challange/features/feed/presentation/widgets/card_post.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/card_shimmer.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/no_more_data.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/progress_indicator.dart';
import 'package:tizo_challange/features/feed/controllers/post_controller.dart';

import 'package:tizo_challange/features/feed/data/models/post_model.dart';
import 'package:tizo_challange/features/feed/utils/utils.dart';

import 'package:tizo_challange/features/post_saved/controller/post_cache_controller.dart';

import 'package:tizo_challange/shared/styles/global_styles.dart';

class Feed extends StatefulWidget {
  const Feed({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  FeedState createState() => FeedState();
}

class FeedState extends State<Feed> {
  final PostController controller = Get.put(PostController());
  final PostCacheController cacheController = Get.put(PostCacheController());

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.maxScrollExtent ==
          widget.scrollController.offset) {
        controller.fetchPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(gradient: Globalstyles.gradientBG),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Obx(
            () {
              if (controller.isLoading.value && controller.posts.isEmpty) {
                return _buildLoadingState(context);
              }
              return ListView.separated(
                controller: widget.scrollController,
                itemCount: controller.posts.length + 1,
                itemBuilder: (context, index) {
                  return index < controller.posts.length
                      ? _buildPostCard(index)
                      : _buildLoadMoreWidget();
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

  Widget _buildLoadingState(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.white,
        child: ListView.separated(
          itemBuilder: (context, index) => const CardShimmer(),
          separatorBuilder: (context, _) => const SizedBox(height: 10),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget _buildPostCard(int index) {
    final PostModel post = controller.posts[index];

    return CardPost(
      index: index,
      dataPost: post,
      goToPost: () => navigateToPost(post, index),
      showCommentBtn: true,
    );
  }

  Widget _buildLoadMoreWidget() {
    return controller.hasMore.value
        ? const MyProgressIndicator()
        : NoMoreData(
            scrollToTop: () => scrollToTop(
              widget.scrollController,
            ),
          );
  }
}
