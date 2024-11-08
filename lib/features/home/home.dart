import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tizo_challange/features/home/controller/home_controller.dart';

import 'package:tizo_challange/features/home/utils/utils.dart';
import 'package:tizo_challange/features/post_saved/controller/post_cache_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController homeController = Get.put(HomeController());
  final PostCacheController postLength = Get.put(PostCacheController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PersistentTabView(
          context,
          controller: homeController.navBarController,
          screens: buildScreens(homeController.scrollController),
          items: navBarsItems(postLength.posts.length),
          navBarStyle: NavBarStyle.style7,
          backgroundColor: Colors.black,
          isVisible: homeController.isNavBarVisible.value,
        ),
      ),
    );
  }
}
