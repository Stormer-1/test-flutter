import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/cubit/full_news_screen_cubit.dart';
import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/full_news_screen.dart';
import 'package:era_developers_test_flutter/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      controller: _scrollController,
      children: [
        // featured news
        const Padding(
          padding: EdgeInsets.only(left: 28.0, top: 42),
          child: Text(
            "Featured",
            style: AppTextStyles.text20m,
          ),
        ),

        const SizedBox(height: 20),

        // featured news feed
        AnimatedBuilder(
            animation: _scrollController,
            builder: (context, child) {
              // print(_scrollController.offset);
              print(_scrollController.position.pixels);

              return SizedBox(
                height: _scrollController.position.pixels >= 300
                    ? 103
                    : _scrollController.position.pixels <= 0
                        ? 250
                        : 300 - _scrollController.position.pixels,
                child: BlocBuilder<NewsScreenCubit, NewsScreenState>(
                  builder: (context, state) => switch (state) {
                    NewsScreenInitial() => const SizedBox(),
                    NewsScreenLoading() =>
                      const CircularProgressIndicator.adaptive(),
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
              );
            }),

        const SizedBox(height: 20),

        // latest news
        const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(
            "Latest news",
            style: AppTextStyles.text20m,
          ),
        ),

        const SizedBox(height: 20),

        // latest news feed
        BlocBuilder<NewsScreenCubit, NewsScreenState>(
          builder: (context, state) => switch (state) {
            NewsScreenInitial() => const SizedBox(),
            NewsScreenLoading() => const CircularProgressIndicator.adaptive(),
            NewsScreenSuccess(
              latestArticles: List<Article> latestArticles,
            ) =>
              Column(
                children: List.generate(
                  latestArticles.length,
                  (index) => InkWell(
                    onTap: () {
                      context.read<NewsScreenCubit>().markArticleAsRead(index);
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

        const SizedBox(height: 250),
      ],
    );
  }
}
