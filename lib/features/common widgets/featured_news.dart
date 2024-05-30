import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        height: 300,
        // width: 358,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/images/code_1.jpeg"),
            ),
            const Positioned(
              top: 150.0,
              bottom: 40,
              left: 20,
              right: 150,
              child: Text(
                "We are processing your request... ",
                style: AppTextStyles.text28r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
