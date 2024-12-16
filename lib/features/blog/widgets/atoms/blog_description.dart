import 'package:flutter/material.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class BlogDescription extends StatelessWidget {
  final String text;

  const BlogDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: SomnioColors.blackSomnio,
          height: 1.5,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
