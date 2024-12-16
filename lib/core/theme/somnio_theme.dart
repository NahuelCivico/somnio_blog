import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SomnioTheme {
  static final SomnioTheme _instance = SomnioTheme._internal();

  factory SomnioTheme() {
    return _instance;
  }

  SomnioTheme._internal();

  ThemeData get defaultTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.montserratTextTheme(),
    );
  }
}
