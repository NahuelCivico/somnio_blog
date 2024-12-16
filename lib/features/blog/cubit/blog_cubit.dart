import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somnio_blog/core/models/post.dart';
import 'blog_repository.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  final BlogRepository blogRepository;

  BlogCubit({required this.blogRepository}) : super(BlogLoading()) {
    fetchPosts();
  }

  int currentPage = 1;
  final int limit = 20;

  Future<void> fetchPosts() async {
    final currentState = state;
    final List<Post> currentPosts =
        currentState is BlogLoaded ? currentState.posts : [];

    final response =
        await blogRepository.fetchPosts(page: currentPage, limit: limit);

    response.fold(
      (failure) => emit(BlogError(message: failure.message)),
      (newPosts) {
        emit(BlogLoaded(posts: [...currentPosts, ...newPosts]));
        currentPage++;
      },
    );
  }
}
