import 'package:flutter/material.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class BlogAuthorPersonalData extends StatelessWidget {
  const BlogAuthorPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nahuel Civico',
          style: TextStyle(
            color: SomnioColors.blackSomnio,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Feb 6, 1992',
          style: TextStyle(
            color: SomnioColors.blackSomnio,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
