import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tizo_challange/features/home/home.dart';
import 'package:tizo_challange/features/postsaved/post_saved.dart';
import 'package:tizo_challange/features/splashscreen/splash_screen.dart';

class AppRoutes {
  static const INITIAL = '/';

  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => Home(),
    ),
    GetPage(
      name: '/local',
      page: () => const PostSaved(),
    ),
  ];
}
