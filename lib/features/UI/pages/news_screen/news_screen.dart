import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:era_developers_test_flutter/features/UI/pages/news_screen/widgets/news_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  static const routeName = '/';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
        title: const Text(
          "Notifications",
          style: AppTextStyles.text18r,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: context.read<NewsScreenCubit>().markAllAsRead,
              child: const Text(
                "Mark all read",
                style: AppTextStyles.text18r,
              ),
            ),
          ),
        ],
      ),
      body: const NewsFeed(),
    );
  }
}
