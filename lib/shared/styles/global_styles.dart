
import 'package:flutter/material.dart';

class Globalstyles {
  // Colores principales
  static const Color primary = Color(0xFF6200EE); // Ejemplo de color primario
  static const Color secondary =
      Color(0xFF03DAC6); // Ejemplo de color secundario

  static LinearGradient gradientBG = const LinearGradient(
    colors: [Color(0xff20182d), Color(0xff202044)],
    stops: [0.25, 0.75],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  // Colores de texto
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;

  // Colores de fondo
  static const Color background = Color(0xFF121212);
  static const Color cardBackground = Color(0xff252138);

  // Otros colores
  static const Color accent = Color(0xFFFF5722);
  static const Color error = Colors.redAccent;
}