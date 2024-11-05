import 'package:flutter/material.dart';

class NoMoreData extends StatelessWidget {
  const NoMoreData({super.key, required this.scrollToTop});
  final VoidCallback scrollToTop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextButton(
          onPressed: scrollToTop,
          child: const Text("No hay más posts para mostrar"),
        ),
      ),
    );
  }
}
