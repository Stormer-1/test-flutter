import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/cubit/full_news_screen_cubit.dart';
import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/full_news_screen.dart';
import 'package:era_developers_test_flutter/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:era_developers_test_flutter/features/UI/pages/news_screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NewsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => NewsScreenCubit(),
          child: const NewsScreen(),
        ),
      );
      case FullNewsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => FullNewsScreenCubit(settings.arguments as String),
          child: const FullNewsScreen(),
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => const Text('Invalid route'));
  }

}
