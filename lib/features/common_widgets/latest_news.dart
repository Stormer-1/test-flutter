import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:flutter/material.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: SizedBox(
        height: 103,
        // width: 356,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 1,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    article.imageUrl,
                    height: 60,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 23),
                child: SizedBox(
                  width: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: AppTextStyles.text16m,
                      ),
                      const SizedBox(height: 11),
                      Text(
                        article.publicationDate as String,
                        style: AppTextStyles.text12r,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
