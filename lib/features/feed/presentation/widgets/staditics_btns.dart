import 'package:flutter/material.dart';
import 'package:tizo_challange/features/feed/utils/utils.dart';

class StaditicsBtns extends StatelessWidget {
  const StaditicsBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _myTextIconBtn(
          context: context,
          reactions: "10 liked",
          myIcon: Icons.favorite,
        ),
        _myTextIconBtn(
          context: context,
          reactions: "15 comments",
          myIcon: Icons.mode_comment,
        ),
      ],
    );
  }

  Widget _myTextIconBtn({
    required BuildContext context,
    required String reactions,
    required IconData myIcon,
  }) {
    return TextButton.icon(
      onPressed: () => dialogBuilder(context),
      icon: Icon(
        myIcon,
        color: Colors.white,
        size: 18,
      ),
      label: Text(
        reactions,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
