import 'package:bloc/bloc.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:meta/meta.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  NewsScreenCubit() : super(NewsScreenInitial());
}
