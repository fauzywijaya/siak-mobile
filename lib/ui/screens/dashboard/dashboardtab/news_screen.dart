import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/viewmodels/news/news_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/list_news_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<NewsProvider>(
      context,
      listen: false,
    ).fetchNewsList();
    return Scaffold(
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, provider, _) {
      switch (provider.fetchResultState) {
        case FetchResultState.Loading:
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              size: 70,
              color: bluePrimary,
            ),
          );
        case FetchResultState.HasData:
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.newsModel?.data?.length,
            itemBuilder: (context, index) {
              return ListNewWidget(
                title: provider.newsModel?.data?[index].title ?? "",
                date: provider.newsModel?.data?[index].createdAt ?? "",
              );
            },
          );
        case FetchResultState.NoData:
          return Center(
            child: ErrorPlaceHolder(
              animation: Assets.images.illustrationDevelopment.path,
              text: 'Fitur ini sedang dalam pengembangan',
            ),
          );
        case FetchResultState.Failure:
          return ListView(
            children: [Center(
                child: ErrorPlaceHolder(
                  animation: Assets.images.illustrationNoConnection.path,
                  text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                  hasButton: true,
                  buttonText: 'Coba Lagi',
                  onButtonTap: () {},
                )
            )],
          );
        default:
          return const Center(
              child: Text("Unknown"));
      }
    });
  }
}
