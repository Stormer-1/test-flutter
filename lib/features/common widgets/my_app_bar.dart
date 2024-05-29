import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      );
  }
}