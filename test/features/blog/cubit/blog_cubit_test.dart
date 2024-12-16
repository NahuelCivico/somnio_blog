import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:somnio_blog/core/helpers/failure.dart';
import 'package:somnio_blog/core/models/post.dart';
import 'package:dartz/dartz.dart';
import 'package:somnio_blog/features/blog/cubit/blog_cubit.dart';
import 'package:somnio_blog/features/blog/cubit/blog_repository.dart';

class MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  late MockBlogRepository mockBlogRepository;
  late BlogCubit blogCubit;

  // Datos comunes para las pruebas
  List<Post> mockPosts = [
    Post(id: 1, title: 'Post 1', description: 'Description 1'),
    Post(id: 2, title: 'Post 2', description: 'Description 2'),
  ];

  // Función para inicializar el cubit con configuraciones
  BlogCubit createCubitWithSuccess() {
    when(() => mockBlogRepository.fetchPosts(
        page: any(named: 'page'),
        limit: any(named: 'limit'))).thenAnswer((_) async => Right(mockPosts));
    return BlogCubit(blogRepository: mockBlogRepository);
  }

  BlogCubit createCubitWithFailure() {
    when(() => mockBlogRepository.fetchPosts(
            page: any(named: 'page'), limit: any(named: 'limit')))
        .thenAnswer((_) async => const Left(ServerFailure('Error de red')));
    return BlogCubit(blogRepository: mockBlogRepository);
  }

  setUp(() {
    // Configurar el repositorio mock
    mockBlogRepository = MockBlogRepository();
  });

  tearDown(() {
    blogCubit.close();
  });

  group('BlogCubit Tests', () {
    test('emite BlogLoaded con posts cuando fetchPosts es exitoso', () async {
      // Arrange: Crear cubit con éxito
      blogCubit = createCubitWithSuccess();

      // Act y Assert
      await expectLater(
        blogCubit.stream,
        emitsInOrder([
          BlogLoaded(posts: mockPosts),
        ]),
      );

      verify(() => mockBlogRepository.fetchPosts(page: 1, limit: 20)).called(1);
    });

    test('emite BlogError cuando fetchPosts falla', () async {
      // Arrange: Crear cubit con error
      blogCubit = createCubitWithFailure();

      // Act y Assert
      await expectLater(
        blogCubit.stream,
        emitsInOrder([
          const BlogError(message: 'Error de red'),
        ]),
      );

      verify(() => mockBlogRepository.fetchPosts(page: 1, limit: 20)).called(1);
    });
  });
}
