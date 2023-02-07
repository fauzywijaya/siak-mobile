import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/model/menu/menu_payment_model.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';

import '../../../constant/constant.dart';
import '../../../widgets/ErrorPlaceholder.dart';
import '../../../widgets/custom_menu.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future<void> refreshHome(BuildContext context) async {
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
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
                    color: Colors.white,
                  ),
                ) : _buildContent(context);
              case false:
                return Center(
                  child: ErrorPlaceHolder(
                    animation: Assets.images.illustrationNoConnection.path,
                    text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                    hasButton: true,
                    buttonText: 'Refresh',
                    onButtonTap: () async {
                      refreshHome(context);
                      ConnectionProvider.instance(context).setLoading(true);
                      await Future.delayed(const Duration(seconds: 2), () {
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
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: MasonryGridView.builder(
          gridDelegate:
          const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          crossAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          itemCount: 15,
          itemBuilder: (context, index) {
            final MenuPaymentModel menus = menuPaymentModel[index];
            return CustomMenu(
                title: menus.title,
                icon: menus.icon,
                height: ((index == 1) ||
                    (index == 3) ||
                    (index == 6) ||
                    (index == 9) ||
                    (index == 12 || (index == 13)))
                    ? 115
                    : 130,
                active: menus.isAktif,
                destination: menus.navigator);

          }),
    ),
  );
}
