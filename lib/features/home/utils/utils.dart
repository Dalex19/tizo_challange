import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tizo_challange/features/feed/feed.dart';
import 'package:tizo_challange/features/profile/profile.dart';

List<Widget> buildScreens() {
  return const [
    Feed(),
    Profile()
  ];
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    _buildNavBarItem(Icons.home, "Home"),
    _buildNavBarItem(Icons.search, "Search"),
 
  ];
}

PersistentBottomNavBarItem _buildNavBarItem(IconData icon, String title) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    title: title,
    activeColorPrimary: Colors.teal,
    activeColorSecondary: Colors.yellow,
    inactiveColorPrimary: Colors.grey,
  );
}