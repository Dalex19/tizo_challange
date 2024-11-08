import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:tizo_challange/shared/global_utils.dart';

class NetworkService extends GetxService {
  final Connectivity _connectivity = Connectivity();
  var isConnected = Rxn<bool>();

  Future<NetworkService> init() async {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    return this;
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      showSnackBarNetwork(message: "Por favor, revisa tu conexión.");
    } else {
      isConnected.value = true;
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
