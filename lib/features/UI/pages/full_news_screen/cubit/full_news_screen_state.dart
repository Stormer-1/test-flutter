part of 'full_news_screen_cubit.dart';

@immutable
sealed class FullNewsScreenState {
  final Article? article;

  const FullNewsScreenState({
    required this.article,

  });
}

final class FullNewsScreenInitial extends FullNewsScreenState {
  const FullNewsScreenInitial({
    super.article,

  });
}

final class FullNewsScreenLoading extends FullNewsScreenState {
  const FullNewsScreenLoading({
    required super.article,
  });
}

final class FullNewsScreenSuccess extends FullNewsScreenState {
  const FullNewsScreenSuccess({
    required super.article,
  });
}

final class FullNewsScreenError extends FullNewsScreenState {
  final String errorMessage;

  const FullNewsScreenError({
    required this.errorMessage,
    required super.article,
  });
}
