import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tizo_challange/features/feed/utils/utils.dart';
import 'package:tizo_challange/features/profile/data/user_model.dart';
import 'package:tizo_challange/features/profile/presentation/widgets/label_with_expansion_panel.dart';

import 'package:tizo_challange/features/profile/controller/profile_controller.dart';
import 'package:tizo_challange/shared/global_utils.dart';
import 'package:tizo_challange/shared/styles/global_styles.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Globalstyles.gradientBG),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: size.width,
        child: Obx(
          () {
            final userProfile = profileController.ownerProfile.value;

            if (profileController.isLoading.value && userProfile == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                _buildProfileHeader(context, size, userProfile),
                SizedBox(height: size.height * 0.05),
                _buildInfoSection(userProfile),
              ],
            );
          },
        ),
      ),
    );
  }

  // Encabezado con avatar y nombre del perfil
  Widget _buildProfileHeader(
      BuildContext context, Size size, UserModel? userProfile) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Globalstyles.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(GlobalUtils.photo),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${userProfile?.name} \n',
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                  text: "@${userProfile?.username}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => dialogBuilder(context),
            child: const Text("Editar"),
          )
        ],
      ),
    );
  }

  // Sección de expansión con información adicional
  Widget _buildInfoSection(UserModel? userProfile) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Globalstyles.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LabelWithExpansionPanel(
            label: "Información Personal",
            bodyExpansionPanel: [
              Text("Correo: ${userProfile?.email}"),
              Text("Ciudad: ${userProfile?.address.city}"),
              Text("Teléfono: ${userProfile?.phone}"),
            ],
          ),
          LabelWithExpansionPanel(
            label: "Información Profesional",
            bodyExpansionPanel: [
              Text("WebSite: ${userProfile?.website}"),
              Text("Empresa: ${userProfile?.company.name}"),
            ],
          ),
          _logOutBtn(),
        ],
      ),
    );
  }

  Widget _logOutBtn() {
    return TextButton.icon(
      onPressed: () => Get.toNamed("/"),
      icon: const Icon(Icons.logout_rounded, color: Globalstyles.accent),
      label: const Text(
        'Salir',
        style: TextStyle(color: Globalstyles.accent),
      ),
    );
  }
}
