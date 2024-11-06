 import 'package:flutter/material.dart';

Widget skeleton({ double? height, double? width}) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }