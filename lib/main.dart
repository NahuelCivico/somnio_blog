import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somnio_blog/core/app/somnio_blog_app.dart';
import 'package:somnio_blog/features/blog/cubit/blog_cubit.dart';
import 'package:somnio_blog/features/blog/cubit/blog_repository.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => BlogRepository(),
      child: BlocProvider(
        create: (context) => BlogCubit(
          blogRepository: context.read<BlogRepository>(),
        ),
        child: const SomnioBlogApp(),
      ),
    ),
  );
}
