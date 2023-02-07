
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/viewmodels/news/dpa_news_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/list_dpa_widget.dart';

class NewsDpaScreen extends StatelessWidget {
  const NewsDpaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<DpaNewsProvider>(
      context,
      listen: false,
    ).fetchDpaNews();

    Widget _buidlContent(BuildContext context){
      return Consumer<DpaNewsProvider>(
        builder: (context, provider, _) {
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
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.dpaNewsModel?.data.length,
                  itemBuilder: (context, index) {
                    return ListDpaWidget(
                      title: provider.dpaNewsModel?.data[index].title ?? "",
                      content: provider.dpaNewsModel?.data[index].content ?? "",
                      date: provider.dpaNewsModel?.data[index].createdAt ?? "",
                    );
                  },
                  );
            case FetchResultState.NoData:
              return Center(
                child: ErrorPlaceHolder(
                  animation: Assets.images.illustrationDevelopment.path ,
                  text: 'Fitur ini sedang dalam pengembangan',
                ),
              );
            case FetchResultState.Failure:
              return Center(
                  child: ErrorPlaceHolder(
                    animation: Assets.images.illustrationNoConnection.path ,
                    text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                    hasButton: true,
                    buttonText: 'Coba Lagi',
                    onButtonTap: () {},
                  )
              );
            default:
              return Center(child: Text("Unknown"));
          }
        }
      );
    }
    return Scaffold(
      body: _buidlContent(context),
    );
  }
}
