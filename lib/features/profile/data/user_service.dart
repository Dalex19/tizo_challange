import 'package:tizo_challange/features/profile/data/user_model.dart';
import 'package:tizo_challange/shared/api/api_service.dart';

class UserService extends ApiService {
  Future<UserModel> getUser() async {
    try {
      final response = await getRequest("users/1");
      final dynamic responseData = response.data;

      final UserModel user = UserModel.fromJson(responseData);
      return user;
    } catch (e) {
      throw Exception("Error al obtener tu perfil");
    }
  }
}
