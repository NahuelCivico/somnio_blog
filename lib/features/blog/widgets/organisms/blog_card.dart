import 'package:flutter/material.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_category.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_description.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_footer_image.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_read_more.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_title.dart';
import 'package:somnio_blog/features/blog/widgets/molecules/blog_author.dart';

class BlogCard extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final VoidCallback onReadMore;

  const BlogCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: SomnioColors.whiteSomnio,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          BlogCategory(id: id),
          const SizedBox(width: 16),
          const SizedBox(height: 20),
          BlogTitle(text: title),
          const SizedBox(height: 10),
          Expanded(child: BlogDescription(text: description)),
          const SizedBox(height: 10),
          const BlogAuthor(),
          const SizedBox(height: 16),
          const BlogReadMore(),
          const SizedBox(height: 16),
          const BlogFooterImage(),
        ],
      ),
    );
  }
}
