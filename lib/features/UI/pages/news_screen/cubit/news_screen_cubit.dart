import 'package:bloc/bloc.dart';
import 'package:era_developers_test_flutter/domain/repositories/news/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  final AbstractNewsRepository repository = MockNewsRepository();

  NewsScreenCubit() : super(const NewsScreenInitial()) {
    _getArticles();
  }

  void _getArticles() async {
    try {
      emit(
        NewsScreenLoading(
          featuredArticles: state.featuredArticles,
          latestArticles: state.latestArticles,
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      final featured = await repository.getFeaturedArticles();
      final latest = await repository.getLatestArticles();
      emit(
        NewsScreenSuccess(
          featuredArticles: featured,
          latestArticles: latest,
        ),
      );
    } catch (e) {
      emit(
        NewsScreenError(
          featuredArticles: state.featuredArticles,
          latestArticles: state.latestArticles,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void markAllAsRead() {
    for (var element in state.latestArticles) {
      if (!element.read) {
        element.read = true;
      }
    }
    emit(
      NewsScreenSuccess(
        featuredArticles: state.featuredArticles,
        latestArticles: state.latestArticles,
      ),
    );
  }

  void markArticleAsRead(int index) {
    state.latestArticles[index].read = true;
    // state.latestArticles.firstWhere((element) => false);
    emit(
      NewsScreenSuccess(
        featuredArticles: state.featuredArticles,
        latestArticles: state.latestArticles,
      ),
    );
  }
}
