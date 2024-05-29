import 'package:era_developers_test_flutter/features/UI/pages/news_screen/news_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForestVPN test',
      home: NewsScreen(),
    );
  }
}
