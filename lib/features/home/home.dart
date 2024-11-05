import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tizo_challange/features/feed/state/post_controller.dart';
import 'package:tizo_challange/features/home/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PersistentTabController _controller;
  final ScrollController _scrollController = ScrollController();
  bool navBarIsVisible = true;

  @override
  void initState() {
    super.initState();
    Get.lazyPut<PostController>(() => PostController());
    _controller = PersistentTabController(initialIndex: 0);
    _scrollController.addListener(listen);
  }

  void listen() {
    final direction = _scrollController.position.userScrollDirection;

    if(direction == ScrollDirection.forward) {
      setState(() {
        navBarIsVisible = false;
      });
    } else if (direction == ScrollDirection.reverse) {
      setState(() {
        navBarIsVisible = true;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: buildScreens(),
        items: navBarsItems(),
        navBarStyle: NavBarStyle.style7,
        backgroundColor: Colors.black,
        isVisible: navBarIsVisible,
      ),
    );
  }
}
