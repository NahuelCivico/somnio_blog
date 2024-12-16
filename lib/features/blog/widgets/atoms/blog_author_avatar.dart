import 'package:flutter/material.dart';

class BlogAuthorAvatar extends StatelessWidget {
  const BlogAuthorAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage('assets/images/nahubitconf.jpg'),
    );
  }
}
