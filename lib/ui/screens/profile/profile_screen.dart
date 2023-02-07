import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/screens/profile/profiletab/dpa_profile_screen.dart';
import 'package:siak_app/ui/screens/profile/profiletab/identity_screen.dart';
import 'package:siak_app/ui/screens/profile/profiletab/ikhtisar_screen.dart';
import 'package:siak_app/ui/screens/profile/profiletab/parent_screen.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/custom_card_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> refreshHome(BuildContext context) async {
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: whiteSecondary,
        elevation: 0,
      ),
      backgroundColor: whiteSecondary,
      body: SafeArea(
        child: Consumer<ConnectionProvider>(
          builder: (context, connectionProvider, _) {
            switch (connectionProvider.internetConnected){
              case true :
                return (connectionProvider.isLoading) ? Center(
                  child: LoadingAnimationWidget.inkDrop(
                    size: 100,
                    color: Colors.white,
                  ),
                ) : _buildContent(context);
              case false :
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
          },
        ),
      ),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
              child:
              Consumer<LoginProvider>(builder: (context, data, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomCardProfile(
                    nim: data.mahasiswaData?.attributes?.nim ?? "",
                    name: data.mahasiswaData?.attributes?.nama ?? "",
                    jurusan: data.mahasiswaData?.relationships?.prodi?.attributes.nama ?? "",
                    gender: data.mahasiswaData?.attributes?.jenisKelamin ?? "",
                  ),
                );
              })
          ),
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
              TabBar(
                padding: EdgeInsets.zero,
                labelColor: bluePrimary,
                indicatorSize: TabBarIndicatorSize.label,
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
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      "Ikhtisar",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Profile",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Orang Tua",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "DPA",
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
        ];
      },
      body: const TabBarView(
        children: [
          IkhtisarScreen(),
          IdentityScreen(),
          ParentScreen(),
          DpaProfileScreen(),
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
