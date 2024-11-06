import 'package:get/get.dart';

import 'package:tizo_challange/features/checkconnection/network_controller.dart';

class NetworkInjectionDependecy {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
