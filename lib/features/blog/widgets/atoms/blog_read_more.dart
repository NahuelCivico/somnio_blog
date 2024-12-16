import 'package:flutter/material.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class BlogReadMore extends StatelessWidget {
  const BlogReadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: InkWell(
        onTap: () {},
        child: const Row(
          children: [
            Text(
              'Read more',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: SomnioColors.blueSomnio,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              Icons.arrow_forward,
              size: 16,
              color: SomnioColors.blueSomnio,
            ),
          ],
        ),
      ),
    );
  }
}
