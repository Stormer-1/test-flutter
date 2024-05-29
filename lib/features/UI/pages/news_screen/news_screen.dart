import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/common%20widgets/featured_news.dart';
import 'package:era_developers_test_flutter/features/common%20widgets/latest_news.dart';
import 'package:era_developers_test_flutter/features/common%20widgets/news_feed.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

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
              onPressed: () {},
              child: const Text(
                "Mark all read",
                style: AppTextStyles.text18r,
              ),
            ),
          ),
        ],
      ),
      body: NewsFeed(),
    );
  }
}
