import 'package:flutter/material.dart';
import 'package:somnio_blog/core/helpers/constants.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Constants.imageSomnioError,
        ),
        const SizedBox(height: 16),
        const Text(
          Constants.error,
          style: TextStyle(
            color: SomnioColors.blackSomnio,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
