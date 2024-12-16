import 'package:flutter/material.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_author_avatar.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_author_personal_data.dart';

class BlogAuthor extends StatelessWidget {
  const BlogAuthor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlogAuthorAvatar(),
          SizedBox(width: 12),
          BlogAuthorPersonalData(),
        ],
      ),
    );
  }
}
