import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tizo_challange/features/feed/data/models/comments_model.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/comments_header.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/comments_item.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({super.key, required this.allComments});
  final List<CommentsModel> allComments;

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _panelController,
      minHeight: 80,
      maxHeight: 500,
      collapsed: const CommentsHeader(),
      panel: ListView.separated(
        itemCount: widget.allComments.length,
        itemBuilder: (context, index) {
          return CommentItem(
            comment: widget.allComments[index],
            index: index,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
      ),
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    );
  }
}
