import 'package:flutter/material.dart';
import 'package:tizo_challange/shared/widgets/skeleton.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        skeleton(
          height: 180,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            skeleton(
              width: 45,
              height: 45,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                children: [
                  skeleton(),
                  const SizedBox(height: 5),
                  skeleton(),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

 

}

