import 'package:get/get.dart';
import 'package:tizo_challange/features/checkconnection/network_service.dart';
import 'package:tizo_challange/features/profile/data/user_model.dart';
import 'package:tizo_challange/features/profile/data/user_service.dart';

class ProfileController extends GetxController {
  final UserService _userService = UserService();
  final NetworkService _networkService = Get.find<NetworkService>();

  var ownerProfile = Rxn<UserModel>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    //Se ejecuta solo una vez
    getUser();

    //Se ejecuta, solo si detecta cambios
    ever(_networkService.isConnected, (bool? isConnected) {
      if (isConnected == true) {
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
