import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tizo_challange/features/checkconnection/network_Injection_dependecy.dart';
import 'package:tizo_challange/shared/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
 NetworkInjectionDependecy.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData.dark(),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.routes,
    );
  }
}

