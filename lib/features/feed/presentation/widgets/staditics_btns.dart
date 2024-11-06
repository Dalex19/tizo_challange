import 'package:flutter/material.dart';
import 'package:tizo_challange/features/feed/utils/utils.dart';
import 'package:tizo_challange/shared/widgets/my_text_icon.dart';

class StaditicsBtns extends StatelessWidget {
  const StaditicsBtns({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyTextIcon(
          doSomething: () => dialogBuilder(context),
          reactions: "10 liked",
          icon: Icons.favorite,
        ),
        MyTextIcon(
          doSomething: () => dialogBuilder(context),
          reactions: "15 comments",
          icon: Icons.mode_comment,
        ),
        
      ],
    );
  }
}
