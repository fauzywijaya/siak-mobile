import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/screens/dashboard/dashboardtab/dashboard_menu_screen.dart';
import 'package:siak_app/ui/screens/dashboard/dashboardtab/news_dpa_screen.dart';
import 'package:siak_app/ui/screens/dashboard/dashboardtab/news_screen.dart';
import 'package:siak_app/ui/widgets/custom_card_dashboard.dart';
import '../../../core/data/api.dart';
import '../../../gen/assets.gen.dart';
import '../../widgets/ErrorPlaceholder.dart';

class DashboardMahasiswaScreen extends StatefulWidget {
  const DashboardMahasiswaScreen({Key? key}) : super(key: key);

  @override
  State<DashboardMahasiswaScreen> createState() => _DashboardMahasiswaScreenState();
}

class _DashboardMahasiswaScreenState extends State<DashboardMahasiswaScreen> {

  Future<void> refreshHome(BuildContext context) async {
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteSecondary,
        body: Consumer<ConnectionProvider>(
          builder: (context, connectionProvider, _) {
          switch (connectionProvider.internetConnected) {
            case true:
              return
                (connectionProvider.isLoading)
                    ? Center(
                      child: LoadingAnimationWidget.inkDrop(
                          size: 100,
                          color: bluePrimary,
                          )
                        )
                    : _buildBodyContent(context);
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
      ),
    );
  }
}

Widget _buildBodyContent(BuildContext context) {
  return  DefaultTabController(
    length: 3,
    child: NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: whiteSecondary,
            floating: true,
            pinned: true,
            title: const Text("Dashboard"),
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Consumer<LoginProvider>(
              builder: (context, loginProvider, _) {
                return CustomCardDashboard(
                  name: loginProvider.mahasiswaData?.attributes?.nama ??"",
                  gender: loginProvider.mahasiswaData?.attributes?.jenisKelamin ?? "",
                );
              },
            ),
          ),
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
              TabBar(
                labelColor: bluePrimary,
                indicatorSize: TabBarIndicatorSize.label,
                // isScrollable: true,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: bluePrimary, width: 2.0),
                ),
                labelStyle: styleTitle.copyWith(
                  fontSize: 16,
                  fontFamily: FontFamily.nunitoSans,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: grayText,
                unselectedLabelStyle: styleTitle.copyWith(
                  fontSize: 16,
                  fontFamily: FontFamily.nunitoSans,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      "Terbaru",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Informasi DPA",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Akses Lain",
                    ),
                  )],
              ),
            ),
            pinned: true,
          ),
        ];
      },
      body: const TabBarView(
        children: [
          NewsScreen(),
          NewsDpaScreen(),
          DashboardMenuScreen(),
        ],
      ),
    ),
  );
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: whiteSecondary,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class AliveKeeper extends StatefulWidget {
  int index;

  AliveKeeper({
    required this.index,
    GlobalKey? key,
  }) : super(key: key);

  @override
  AliveKeeperState createState() => AliveKeeperState();
}

class AliveKeeperState extends State<AliveKeeper> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text('Item ${widget.index}');
  }
}
