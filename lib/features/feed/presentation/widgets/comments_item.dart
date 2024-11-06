import 'package:flutter/material.dart';
import 'package:tizo_challange/features/feed/data/models/comments_model.dart';
import 'package:tizo_challange/shared/global_utils.dart';

class CommentItem extends StatelessWidget {
  final CommentsModel comment;
  final int index;

  const CommentItem({
    super.key,
    required this.comment,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              '${GlobalUtils.avatar}$index+2',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.email,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  comment.body,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(height: 1, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _textIndicator(context, "5 minutos"),
                    const SizedBox(width: 10),
                    _textIndicator(context, "15 Likes"),
                    const SizedBox(width: 10),
                    _textIndicator(context, "Responder"),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.favorite,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _textIndicator(BuildContext context, String label) {
    return Text(
      label,
      style:
          Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
    );
  }
}
