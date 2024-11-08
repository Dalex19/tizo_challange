import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:tizo_challange/features/connection_check/network_injection_dependecy.dart';
import 'package:tizo_challange/features/post_saved/data/posts_cache.dart';

import 'package:tizo_challange/shared/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(PostsCacheAdapter());
  await NetworkInjectionDependecy.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.routes,
    );
  }
}
