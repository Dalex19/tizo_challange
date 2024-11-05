import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tizo_challange/features/feed/feed.dart';
import 'package:tizo_challange/features/feed/state/post_binding.dart';
import 'package:tizo_challange/features/home/home.dart';

import 'package:tizo_challange/features/splashscreen/splash_screen.dart';

class AppRoutes {
  static const INITIAL = '/';

  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/post',
      page: () => const Feed(),
      binding: PostBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => const Home(),
    ),
    
  ];
}
