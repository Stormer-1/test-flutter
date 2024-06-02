import 'package:bloc/bloc.dart';
import 'package:era_developers_test_flutter/domain/repositories/news/abstract_news_repository.dart';
import 'package:era_developers_test_flutter/domain/repositories/news/mock_news_repository.dart';
import 'package:era_developers_test_flutter/domain/models/article.dart';
import 'package:meta/meta.dart';

part 'full_news_screen_state.dart';

class FullNewsScreenCubit extends Cubit<FullNewsScreenState> {
  final AbstractNewsRepository repository = MockNewsRepository();
  final String articleId;

  FullNewsScreenCubit(this.articleId) : super(const FullNewsScreenInitial()) {
    _getArticle();
  }

  _getArticle() async {
    try {
      emit(
        FullNewsScreenLoading(
          article: state.article,
        ),
      );
      await Future.delayed(const Duration(seconds: 1));
      final latest = await repository.getArticle(articleId);
      emit(
        FullNewsScreenSuccess(
          article: latest,
        ),
      );
    } catch (e) {
      emit(
        FullNewsScreenError(
          article: state.article,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
