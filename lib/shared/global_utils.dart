import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class GlobalUtils {
  static const String photo =
      "https://i.pinimg.com/564x/0d/db/ed/0ddbed5b4cd7a076c7d6889cf8a76446.jpg";
  static const String avatar = "https://i.pravatar.cc/150?img=";
}

showSnackBarNetwork({required message}) {
  Get.rawSnackbar(
    messageText: Text(message, style: const TextStyle(color: Colors.white)),
    isDismissible: false,
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.red[400]!,
  );
}
