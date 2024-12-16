import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somnio_blog/core/models/post.dart';
import 'package:somnio_blog/core/widgets/shared/custom_error.dart';
import 'package:somnio_blog/features/blog/cubit/blog_cubit.dart';
import 'package:somnio_blog/features/blog/screens/blog_screen.dart';

// Mock del BlogCubit
class MockBlogCubit extends MockCubit<BlogState> implements BlogCubit {}

void main() {
  late MockBlogCubit mockBlogCubit;

  setUp(() {
    mockBlogCubit = MockBlogCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<BlogCubit>(
        create: (_) => mockBlogCubit,
        child: const BlogScreen(),
      ),
    );
  }

  testWidgets('Muestra una lista de posts cuando el estado es BlogLoaded',
      (WidgetTester tester) async {
    // Arrange
    final mockPosts = [
      Post(id: 1, title: 'Post 1', description: 'Description 1'),
      Post(id: 2, title: 'Post 2', description: 'Description 2'),
    ];

    when(() => mockBlogCubit.state).thenReturn(BlogLoaded(posts: mockPosts));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // Assert
    expect(find.text('Post 1'), findsOneWidget);
    expect(find.text('Post 2'), findsOneWidget);
  });

  testWidgets('Muestra el widget CustomError cuando el estado es BlogError',
      (WidgetTester tester) async {
    // Arrange
    when(() => mockBlogCubit.state)
        .thenReturn(const BlogError(message: 'Error al cargar los posts'));

    // Act
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // Assert
    expect(find.byType(CustomError), findsOneWidget);
  });
}
