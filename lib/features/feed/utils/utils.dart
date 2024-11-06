import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:tizo_challange/features/feed/data/models/post_model.dart';
import 'package:tizo_challange/features/feed/presentation/pages/post.dart';


Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Opción no disponbile'),
        content: const Text(':('),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cerrar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Entendido'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void scrollToTop(ScrollController myController) {
  myController.animateTo(
    0.0,
    duration: const Duration(milliseconds: 800),
    curve: Curves.easeInOut,
  );
}

void navigateToPost(PostModel post, int index) {
  Get.to(
    Post(dataPost: post, index: index),
  );
}

