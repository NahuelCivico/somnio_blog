import 'package:flutter/material.dart';
import 'package:somnio_blog/core/helpers/constants.dart';

class BlogLogoSomnio extends StatelessWidget {
  const BlogLogoSomnio({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.logoSomnioSoftware,
    );
  }
}
