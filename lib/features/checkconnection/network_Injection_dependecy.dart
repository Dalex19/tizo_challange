import 'package:get/get.dart';
import 'package:tizo_challange/features/checkconnection/network_service.dart';

class NetworkInjectionDependecy {
  static Future<void> init() async {
    await Get.putAsync<NetworkService>(() async => NetworkService().init());
  }
}
