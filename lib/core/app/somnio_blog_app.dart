import 'package:flutter/material.dart';
import 'package:somnio_blog/core/helpers/constants.dart';
import 'package:somnio_blog/core/theme/somnio_theme.dart';
import 'package:somnio_blog/features/blog/screens/blog_screen.dart';

class SomnioBlogApp extends StatelessWidget {
  const SomnioBlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SomnioTheme().defaultTheme,
      initialRoute: Constants.blogRoute,
      routes: {
        Constants.blogRoute: (context) => const BlogScreen(),
      },
    );
  }
}
