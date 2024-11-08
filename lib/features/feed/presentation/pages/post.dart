import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizo_challange/features/feed/data/models/post_model.dart';

import 'package:tizo_challange/features/feed/presentation/widgets/card_post.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/card_shimmer.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/comment_box.dart';
import 'package:tizo_challange/features/feed/controllers/comments_controller.dart';
import 'package:tizo_challange/shared/styles/global_styles.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.index,
    required this.dataPost,
  });

  final int index;

  final PostModel dataPost;

  @override
  Widget build(BuildContext context) {
    final CommentController commentController = Get.put(CommentController());
    commentController.fetchComments(index);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Globalstyles.gradientBG),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Obx(() {
          if (commentController.isLoading.value &&
              commentController.comments.isEmpty) {
            return const Center(child: CardShimmer());
          }
          return Stack(
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: CardPost(index: index, dataPost: dataPost),
                  ),
                ],
              ),
              CommentBox(allComments: commentController.comments),
            ],
          );
        }),
      ),
    );
  }
}
