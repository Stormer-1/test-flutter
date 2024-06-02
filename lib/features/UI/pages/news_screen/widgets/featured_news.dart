import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/full_news_screen.dart';
import 'package:era_developers_test_flutter/domain/models/article.dart';
import 'package:flutter/material.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          FullNewsScreen.routeName,
          arguments: article.id,
        );
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 300,
        padding: const EdgeInsets.only(
          left: 20,
          right: 130,
          bottom: 40,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(article.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          article.title,
          style: AppTextStyles.text28s,
        ),
      ),
    );
  }
}
