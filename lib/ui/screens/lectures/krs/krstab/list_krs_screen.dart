import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/viewmodels/krs/krs_provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/custom_expansion_krs.dart';

class ListKrsScreen extends StatefulWidget {
  const ListKrsScreen({Key? key}) : super(key: key);

  @override
  State<ListKrsScreen> createState() => _ListKrsScreenState();
}

class _ListKrsScreenState extends State<ListKrsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
      final KrsProvider krsProvider = Provider.of<KrsProvider>(context, listen: false);

      krsProvider.fetchKRS(loginProvider.mahasiswaData?.id ?? "");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Consumer<KrsProvider>(builder: (context, data, _) {
          switch (data.fetchResultState) {
            case FetchResultState.Loading :
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                  size: 70,
                  color: bluePrimary,
                ),
              );
            case FetchResultState.Failure:
              return Center(
                child: ErrorPlaceHolder(
                  animation: Assets.images.illustrationNoConnection.path,
                  text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                  hasButton: true,
                  buttonText: 'Refresh',
                  onButtonTap: () async {
                    final LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
                    final KrsProvider krsProvider = Provider.of<KrsProvider>(context, listen: false);

                    krsProvider.fetchKRS(loginProvider.mahasiswaData?.id ?? "");
                  },
                ),
              );
            case FetchResultState.NoData:
              return  Center(
                  child: ErrorPlaceHolder(
                    animation: Assets.images.illustrationNoConnection.path ,
                    text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                    hasButton: true,
                    buttonText: 'Coba Lagi',
                    onButtonTap: () {},
                  )
              );
            case FetchResultState.HasData:
              return ListView.builder(
                itemCount: data.krsModel?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = data.krsModel?.data?[index];
                  return CustomExpansionKrs(
                      lessonName: item?.relationships.mataKuliah.attributes.nama ?? "",
                      semester: item?.relationships.mataKuliah.attributes.semester ?? 0,
                      sks: item?.relationships.mataKuliah.attributes.sks ?? 0,
                      kodeMK: item?.relationships.mataKuliah.attributes.kode ?? "");
                },
              );
            case FetchResultState.Searching:
              return const SizedBox();
            }
          }
        ),
      ),
    );
  }
}
