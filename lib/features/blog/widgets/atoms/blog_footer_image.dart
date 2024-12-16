import 'package:flutter/material.dart';
import 'package:somnio_blog/core/helpers/functions.dart';

class BlogFooterImage extends StatelessWidget {
  const BlogFooterImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(Functions.getRandomImage()),
          fit: BoxFit.cover,
        ),
      ),
      height: 150,
    );
  }
}
