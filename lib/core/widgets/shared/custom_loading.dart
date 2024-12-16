import 'package:flutter/material.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: SomnioColors.blueSomnio,
    );
  }
}
