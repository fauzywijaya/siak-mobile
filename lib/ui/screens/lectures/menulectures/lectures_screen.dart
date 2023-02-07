
import 'dart:math';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/model/menu/menu_lectures_model.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/custom_menu.dart';

class LecturesScreen extends StatefulWidget {
  const LecturesScreen({Key? key}) : super(key: key);

  @override
  State<LecturesScreen> createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  Future<void> refreshHome(BuildContext context) async {
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Lectures"),
          backgroundColor: whiteSecondary,
          elevation: 0,
      ),
      backgroundColor: whiteSecondary,
      body: Consumer<ConnectionProvider>(
          builder: (context, connectionProv, _) {
            switch (connectionProv.internetConnected){
              case true:
                return (connectionProv.isLoading) ? Center(
                  child: LoadingAnimationWidget.inkDrop(
                    size: 100,
                    color: bluePrimary,
                  ),
                ) : _buildContent(context);
              case false:
                return Center(
                  child: ErrorPlaceHolder(
                    animation: Assets.images.illustrationNoConnection.path,
                    text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                    hasButton: true,
                    buttonText: 'Refresh',
                    onButtonTap: () {
                      refreshHome(context);
                      ConnectionProvider.instance(context).setLoading(true);
                      Future.delayed(const Duration(seconds: 2), () {
                        ConnectionProvider.instance(context).setLoading(false);
                      });
                    },
                  ),
                );
              default:
                return Center(
                  child: LoadingAnimationWidget.inkDrop(
                    size: 100,
                    color: Colors.white,
                  ),
                );
            }
          }
      ),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount: 10,
          itemBuilder: (context, index){
            final MenuLecturesModel menus = menuLecturesModel[index];
            return CustomMenu(
              title: menus.title,
              icon: menus.icon,
              height: (
                  (index == 1) ||
                  (index == 3) ||
                  (index == 6) ||
                  (index == 9) )
                  ? 115 : 130, active: menus.isAktif, destination: menus.navigator,);
          }),
    );
}


