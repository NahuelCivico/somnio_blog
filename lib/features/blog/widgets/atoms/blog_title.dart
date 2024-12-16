import 'package:flutter/material.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class BlogTitle extends StatelessWidget {
  final String text;

  const BlogTitle({
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
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: SomnioColors.blackSomnio,
        ),
        maxLines: 1,
      ),
    );
  }
}
