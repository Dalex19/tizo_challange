import 'package:flutter/material.dart';
import 'package:tizo_challange/features/feed/data/models/post_model.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/staditics_btns.dart';
import 'package:tizo_challange/features/post_saved/presentation/save_local_post_btn.dart';
import 'package:tizo_challange/shared/global_utils.dart';

import 'package:tizo_challange/shared/styles/global_styles.dart';

class CardPost extends StatelessWidget {
  const CardPost(
      {super.key,
      required this.index,
      required this.dataPost,
      this.goToPost,
      this.showCommentBtn});

  final int index;
  final VoidCallback? goToPost;
  final PostModel dataPost;
  final bool? showCommentBtn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goToPost,
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Globalstyles.secondary,
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              '${GlobalUtils.avatar}$index+1',
                            ),
                          ),
                          const SizedBox(width: 7),
                          RichText(
                            text: TextSpan(
                              text: "@unknown $index\n",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '@unknown $index',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "publishedAt",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: dataPost.title,
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: dataPost.body,
                          style: const TextStyle(height: 1.1),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(children: [
                  const StaditicsBtns(),
                  (showCommentBtn != null)
                      ? SaveLocalPostBtn(
                          id: dataPost.id,
                          title: dataPost.title,
                          body: dataPost.body,
                        )
                      : const SizedBox.shrink()
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
