import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/common%20widgets/featured_news.dart';
import 'package:era_developers_test_flutter/features/common%20widgets/latest_news.dart';
import 'package:flutter/material.dart';


class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assetimage = [
      "assets/images/gadgets.jpeg",
      "assets/images/code_2.jpeg",
      "assets/images/iphone.jpeg",
    ];

    return ListView(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 28.0, top: 42),
          child: Text(
            "Featured",
            style: AppTextStyles.text20m,
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) => const FeaturedNews(),
          ),
        ),

        const SizedBox(height: 20),

        // latest news feed
        // latest news
        const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(
            "Latest news",
            style: AppTextStyles.text20m,
          ),
        ),

        const SizedBox(height: 20),

        // latest news feed
        ...assetimage.map(
          (e) => LatestNews(article: ),
        ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 3,
        //     itemBuilder: (context, index) => LatestNews(
        //       image: assetimage[index],
        //     ),
        //   ),
        // ),

        // const SizedBox(height: 170),
      ],
    );
  }
}
