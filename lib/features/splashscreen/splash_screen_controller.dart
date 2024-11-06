import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startSplashTimer();
  }

  void startSplashTimer() {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed("/home");
    });
  }
}
