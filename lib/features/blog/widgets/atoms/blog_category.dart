import 'package:flutter/material.dart';
import 'package:somnio_blog/core/helpers/functions.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class BlogCategory extends StatelessWidget {
  final int id;

  const BlogCategory({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Functions.getRandomColor();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '${Functions.getRandomCategory()} #$id',
          style: TextStyle(
            color: color == SomnioColors.greenSomnio
                ? SomnioColors.blackSomnio
                : SomnioColors.whiteSomnio,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
