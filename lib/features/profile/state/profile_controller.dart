import 'package:get/get.dart';
import 'package:tizo_challange/features/checkconnection/network_controller.dart';
import 'package:tizo_challange/features/profile/data/user_model.dart';
import 'package:tizo_challange/features/profile/data/user_service.dart';

class ProfileController extends GetxController {
  final UserService _userService = UserService();

  var ownerProfile = Rxn<UserModel>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
     // Verifica el estado actual de la conexión cuando se inicia el controlador
    if (Get.find<NetworkController>().isConnected.value) {
      getUser(); 
    }
    // Observar cambios en la conectividad
    ever(Get.find<NetworkController>().isConnected, (isConnected) {
      if (isConnected) {
        getUser();
      } 
    });
  }

  Future<void> getUser() async {
    try {
      isLoading.value = true;
      final response = await _userService.getUser();
      ownerProfile.value = response;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
