import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tizo_challange/features/post_saved/controller/post_cache_controller.dart';
import 'package:tizo_challange/shared/widgets/my_text_icon.dart';

class SaveLocalPostBtn extends StatefulWidget {
  const SaveLocalPostBtn({
    super.key,
    required this.id,
    required this.title,
    required this.body,
  });

  final int id;
  final String title, body;

  @override
  State<SaveLocalPostBtn> createState() => _SaveLocalPostBtnState();
}

class _SaveLocalPostBtnState extends State<SaveLocalPostBtn> {
  final PostCacheController cacheController = Get.put(PostCacheController());
  bool isSaved = false;

  void _handleSave() {
    if (!isSaved) {
      cacheController.addNewPost(
        widget.id,
        widget.title,
        widget.body,
      );
      setState(() {
        isSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextIcon(
      reactions: isSaved ? "Guardado" : "Guardar",
      icon: isSaved ? Icons.book : Icons.book_outlined,
      doSomething: _handleSave,
    );
  }
}
