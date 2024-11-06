import 'package:flutter/material.dart';

class MyTextIcon extends StatelessWidget {
  const MyTextIcon({super.key, required this.reactions, required this.icon, required this.doSomething});

  final String reactions;
  final IconData icon;
  final VoidCallback doSomething;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: doSomething,
      icon: Icon(
        icon,
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