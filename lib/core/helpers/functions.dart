import 'dart:math';

import 'package:flutter/material.dart';
import 'package:somnio_blog/core/helpers/constants.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';

class Functions {
  static Color getRandomColor() {
    Random random = Random();
    int index = random.nextInt(3);
    switch (index) {
      case 0:
        return SomnioColors.blueDarkSomnio;
      case 1:
        return SomnioColors.purpleSomnio;
      case 2:
        return SomnioColors.greenSomnio;
      default:
        return SomnioColors.purpleSomnio;
    }
  }

  static String getRandomImage() {
    Random random = Random();
    int index = random.nextInt(4);
    switch (index) {
      case 0:
        return Constants.imageSomnioVerified;
      case 1:
        return Constants.imageSomnioIO;
      case 2:
        return Constants.imageSomnioFlutterGuy;
      case 3:
        return Constants.imageSomnioCellphoneFlutter;
      default:
        return Constants.imageSomnioVerified;
    }
  }

  static String getRandomCategory() {
    Random random = Random();
    int index = random.nextInt(Constants.allCategories.length);
    return Constants.allCategories[index];
  }
}
