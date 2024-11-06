import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeController extends GetxController {
  late PersistentTabController navBarController;
  late ScrollController scrollController;
  RxBool isNavBarVisible = true.obs;

  void listen() => isNavBarVisible.value =
      scrollController.position.userScrollDirection != ScrollDirection.reverse;

  @override
  void onInit() {
    scrollController = ScrollController();
    navBarController = PersistentTabController(initialIndex: 0);
    scrollController.addListener(listen);
    super.onInit();
  }

  @override
  void onClose() {
    navBarController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
