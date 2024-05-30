part of 'news_screen_cubit.dart';

@immutable
sealed class NewsScreenState {
  final List<Article> articles;

  const NewsScreenState({required this.articles});
}

final class NewsScreenInitial extends NewsScreenState {
  const NewsScreenInitial({super.articles = const []});
}

final class NewsScreenLoading extends NewsScreenState {
  const NewsScreenLoading({required super.articles});
}

final class NewsScreenSuccess extends NewsScreenState {
  const NewsScreenSuccess({required super.articles});
}

final class NewsScreenError extends NewsScreenState {
  final String errorMessage;

  const NewsScreenError({required this.errorMessage, required super.articles});
}
