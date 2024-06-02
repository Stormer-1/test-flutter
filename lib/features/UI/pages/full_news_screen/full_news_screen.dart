// import 'dart:html';

import 'package:era_developers_test_flutter/assets/text_styles.dart';
import 'package:era_developers_test_flutter/features/UI/pages/full_news_screen/cubit/full_news_screen_cubit.dart';
import 'package:era_developers_test_flutter/features/common_widgets/news_information.dart';
import 'package:era_developers_test_flutter/repositories/news/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({
    super.key,
    // required this.article,
  });

  static const routeName = '/fullNewsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 400),
        child: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // title: BlocSelector<FullNewsScreenCubit, FullNewsScreenState, String?>(
          //   selector: (state) {
          //     return state.article?.title;
          //   },
          //   builder: (context, state) {
          //     return state == null ? const SizedBox() :
          //     Text(state);
          //   },
          // ),

          backgroundColor: Colors.white,
          elevation: 2,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: BlocSelector<FullNewsScreenCubit, FullNewsScreenState,
                Article?>(
              selector: (state) {
                return state.article;
              },
              builder: (context, state) {
                return state == null
                    ? const SizedBox()
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 48,
                            right: 150,
                            bottom: 40,
                            top: 350,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                state.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            state.title,
                            style: AppTextStyles.text28s,
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<FullNewsScreenCubit, FullNewsScreenState>(
          builder: (context, state) => switch (state) {
            FullNewsScreenInitial() => const SizedBox(),
            FullNewsScreenLoading() =>
              const CircularProgressIndicator.adaptive(),
            FullNewsScreenSuccess(
              article: Article? article,
            ) =>
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21.0, vertical: 20),
                    child: Text(
                      state.article!.description!,
                      style: AppTextStyles.text16m,
                      // textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            FullNewsScreenError(errorMessage: String errorMessage) =>
              Text(errorMessage)
          },
        ),
      ),
    );
  }
}
