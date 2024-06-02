part of 'news_screen_cubit.dart';

@immutable
sealed class NewsScreenState {
  final List<Article> latestArticles;
  final List<Article> featuredArticles;

  const NewsScreenState({
    required this.latestArticles,
    required this.featuredArticles,
  });
}

final class NewsScreenInitial extends NewsScreenState {
  const NewsScreenInitial({
    super.latestArticles = const [],
    super.featuredArticles = const [],
  });
}

final class NewsScreenLoading extends NewsScreenState {
  const NewsScreenLoading({
    required super.featuredArticles,
    required super.latestArticles,
  });
}

final class NewsScreenSuccess extends NewsScreenState {
  const NewsScreenSuccess({
    required super.featuredArticles,
    required super.latestArticles,
  });
}

final class NewsScreenError extends NewsScreenState {
  final String errorMessage;

  const NewsScreenError({
    required this.errorMessage,
    required super.featuredArticles,
    required super.latestArticles,
  });
}
