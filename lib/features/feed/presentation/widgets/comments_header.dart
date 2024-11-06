import 'package:flutter/material.dart';
import 'package:tizo_challange/shared/widgets/skeleton.dart';

class CommentsHeader extends StatelessWidget {
  const CommentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      height: 100,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            skeleton(width: 60, height: 5),
            Text(
              "Comentarios",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
