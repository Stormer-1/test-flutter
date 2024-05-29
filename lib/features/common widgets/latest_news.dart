import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:flutter/material.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Container(
        height: 103,
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
                    image,
                    height: 60,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 23),
                child: SizedBox(
                  width: 190,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "We are processing your request... ",
                        style: AppTextStyles.text16m,
                      ),
                       SizedBox(height: 11),
                      Text(
                        "1 day ago",
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
