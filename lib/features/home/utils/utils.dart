import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tizo_challange/features/feed/feed.dart';
import 'package:tizo_challange/features/postsaved/post_saved.dart';
import 'package:tizo_challange/features/profile/profile.dart';
import 'package:tizo_challange/shared/styles/global_styles.dart';

List<Widget> buildScreens(ScrollController myCtrl) {
  return [
    Feed(
      scrollController: myCtrl,
    ),
    Profile(),
    const PostSaved(),
  ];
}

List<PersistentBottomNavBarItem> navBarsItems(int count) {
  return [
    _buildNavBarItem(Icons.home, "Inicio"),
    _buildNavBarItem(Icons.person_2, "Perfil"),
    _buildNavBarItemWithBadge(Icons.favorite, "Mis posts", count)
  ];
}

PersistentBottomNavBarItem _buildNavBarItemWithBadge(
    IconData icon, String title, int badgeCount) {
  return PersistentBottomNavBarItem(
    icon: Badge(
      backgroundColor: Colors.pink,
      label: Text(
        badgeCount.toString(),
      ),
      child: Icon(icon),
    ),
    title: title,
    activeColorPrimary: Globalstyles.secondary,
    activeColorSecondary: Colors.white,
    inactiveColorPrimary: Colors.grey,
  );
}

PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String title) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    title: title,
    activeColorPrimary: Globalstyles.secondary,
    activeColorSecondary: Colors.white,
    inactiveColorPrimary: Colors.grey,
  );
}
