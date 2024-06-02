import 'package:era_developers_test_flutter/assets/app_sizes.dart';
import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/full_news_screen.dart';
import 'package:era_developers_test_flutter/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:era_developers_test_flutter/domain/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_news.dart';
import 'latest_news.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _SliverAppBarDelegate(
            minHeight: 190,
            maxHeight: 300,
            child: const _HeaderBody(),
          ),
        ),
        //Sliver
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               gapH20,
              // latest news
              const Padding(
                padding: EdgeInsets.only(left: 28.0),
                child: Text(
                  "Latest news",
                  style: AppTextStyles.text20m,
                ),
              ),
              gapH20,
              // latest news feed
              BlocBuilder<NewsScreenCubit, NewsScreenState>(
                builder: (context, state) => switch (state) {
                  NewsScreenInitial() => const SizedBox(),
                  NewsScreenLoading() =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                  NewsScreenSuccess(
                    latestArticles: List<Article> latestArticles,
                  ) =>
                    Column(
                      children: List.generate(
                        latestArticles.length,
                        (index) => InkWell(
                          onTap: () {
                            context
                                .read<NewsScreenCubit>()
                                .markArticleAsRead(index);
                            Navigator.pushNamed(
                              context,
                              FullNewsScreen.routeName,
                              arguments: latestArticles[index].id,
                            );
                          },
                          child: LatestNews(
                            article: latestArticles[index],
                          ),
                        ),
                      ),
                    ),
                  _ => const SizedBox(),
                },
              ),

              gapH250,
            ],
          ),
        )
      ],
    );
  }
}

class _HeaderBody extends StatelessWidget {
  const _HeaderBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 28.0, top: 42),
          child: Text(
            "Featured",
            style: AppTextStyles.text20m,
          ),
        ),
        gapH20,
        Expanded(
          child: BlocBuilder<NewsScreenCubit, NewsScreenState>(
            builder: (context, state) => switch (state) {
              NewsScreenInitial() => const SizedBox(),
              NewsScreenLoading() =>
                const Center(child: CircularProgressIndicator.adaptive()),
              NewsScreenSuccess(
                featuredArticles: List<Article> featuredArticles,
              ) =>
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredArticles.length,
                  itemBuilder: (context, index) => FeaturedNews(
                    article: featuredArticles[index],
                  ),
                ),
              _ => const SizedBox()
            },
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
