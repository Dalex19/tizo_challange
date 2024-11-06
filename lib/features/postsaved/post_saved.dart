import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tizo_challange/features/postsaved/presentation/no_post_yet.dart';

import 'package:tizo_challange/features/postsaved/state/post_cache_controller.dart';

import 'package:tizo_challange/shared/styles/global_styles.dart';

class PostSaved extends StatefulWidget {
  const PostSaved({super.key});

  @override
  State<PostSaved> createState() => _PostSavedState();
}

class _PostSavedState extends State<PostSaved> {
  final PostCacheController cacheController = Get.put(PostCacheController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(gradient: Globalstyles.gradientBG),
        child: Column(
          children: [
            Text(
              "Todos tus posts disponibles, cuando quieras",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 15),
            Obx(
              () {
                if (cacheController.posts.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: cacheController.posts.length,
                      itemBuilder: (context, index) {
                        final post = cacheController.posts[index];
                        return Card(
                          child: ListTile(
                            title: Text(post.title),
                            subtitle: Text(post.body),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const NoPostYet();
              },
            )
          ],
        ),
      ),
    );
  }
}
