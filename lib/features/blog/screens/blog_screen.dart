import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:somnio_blog/core/helpers/constants.dart';
import 'package:somnio_blog/core/theme/somnio_colors.dart';
import 'package:somnio_blog/core/widgets/shared/custom_loading.dart';
import 'package:somnio_blog/core/widgets/shared/custom_error.dart';
import 'package:somnio_blog/features/blog/cubit/blog_cubit.dart';
import 'package:somnio_blog/features/blog/widgets/atoms/blog_logo_somnio.dart';
import 'package:somnio_blog/features/blog/widgets/organisms/blog_card.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      context.read<BlogCubit>().fetchPosts();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.pin,
                  title: Text(
                    Constants.title,
                    style: TextStyle(
                      color: SomnioColors.blueSomnio,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  background: BlogLogoSomnio(),
                ),
              ),
              SliverAppBar(
                pinned: true,
                primary: false,
                backgroundColor: SomnioColors.blueSomnio,
                title: Align(
                  alignment: AlignmentDirectional.center,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    labelStyle: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(text: Constants.firstTabName),
                      Tab(text: Constants.secondTabName),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount = 1;
                            if (constraints.maxWidth >= 1200) {
                              crossAxisCount = 4;
                            } else if (constraints.maxWidth >= 800) {
                              crossAxisCount = 3;
                            } else if (constraints.maxWidth >= 600) {
                              crossAxisCount = 2;
                            }

                            return BlocBuilder<BlogCubit, BlogState>(
                              buildWhen: (previous, current) =>
                                  previous != current,
                              builder: (context, state) {
                                switch (state) {
                                  case BlogLoading():
                                    return const Center(
                                      child: CustomLoading(),
                                    );
                                  case BlogError():
                                    return const Align(
                                      alignment: Alignment.topCenter,
                                      child: CustomError(),
                                    );
                                  case BlogLoaded():
                                    final posts = state.posts;

                                    return GridView.builder(
                                      controller: scrollController,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 454,
                                        crossAxisCount: crossAxisCount,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                      ),
                                      itemCount: posts.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index < posts.length) {
                                          final post = posts[index];
                                          return BlogCard(
                                            id: post.id,
                                            title: post.title,
                                            description: post.description,
                                            onReadMore: () {},
                                          );
                                        }
                                        return null;
                                      },
                                    );
                                  default:
                                    return const SizedBox.shrink();
                                }
                              },
                            );
                          },
                        ),
                      ),
                      const Placeholder(
                        color: SomnioColors.blueSomnio,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
