import 'package:flutter/material.dart';

class NoPostYet extends StatelessWidget {
  const NoPostYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/no_post.png"),
          Text(
            "Todavia no has guardado nada",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
