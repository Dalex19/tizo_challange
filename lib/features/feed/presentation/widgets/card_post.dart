import 'package:flutter/material.dart';
import 'package:tizo_challange/features/feed/presentation/widgets/staditics_btns.dart';
import 'package:tizo_challange/features/feed/utils/utils.dart';


class CardPost extends StatelessWidget {
  const CardPost({
    super.key,
    required this.title,
    this.description,
    required this.index,
  });

  final String title;
  final String? description;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dialogBuilder(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.4),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=$index+1'),
                      ),
                      const SizedBox(width: 7),
                      RichText(
                        text: TextSpan(
                          text: "@unknown $index\n",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '@unknown $index',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "publishedAt",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: "$title ",
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: description, style: const TextStyle(height: 1.1)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const StaditicsBtns()
          ],
        ),
      ),
    );
  }
}
