import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/screens/lectures/krs/krstab/enroll_krs_screen.dart';
import 'package:siak_app/ui/screens/lectures/krs/krstab/list_krs_screen.dart';
import 'package:siak_app/ui/widgets/custom_drop_down.dart';

class KrsScreen extends StatefulWidget {
  const KrsScreen({Key? key}) : super(key: key);

  @override
  State<KrsScreen> createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  String? _selectedYear;
  String? _selectedSemester;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                _buildSliverAppBar(context),
                _buildSliverToBoxAdapter(context),
                _buildSliverPersistentHeader(context),
              ];
            },
            body: const TabBarView(
              children: [
                ListKrsScreen(),
                EnrollKrsScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context){
    return SliverAppBar(
      backgroundColor: whiteSecondary,
      floating: true,
      pinned: true,
      title: const Text("Kontrak Kuliah"),
      elevation: 0,
    );
  }

  Widget _buildSliverToBoxAdapter(BuildContext context){
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: CustomDropDown(
                  value: _selectedYear,
                  hintText: "Pilih Tahun",
                  options: const [
                    "Ganjil",
                    "Genap",
                  ],
                  onChanged: (text) {
                    setState(() {
                      _selectedYear = text!;
                    });
                  },
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 1,
                child: CustomDropDown(
                  value: _selectedSemester,
                  hintText: "Pilih Tahun",
                  options: const [
                    "Ganjil",
                    "Genap",
                  ],
                  onChanged: (text) {
                    setState(() {
                      _selectedSemester = text!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverPersistentHeader(BuildContext context){
    return SliverPersistentHeader(
      delegate: MySliverPersistentHeaderDelegate(
        TabBar(
          padding: EdgeInsets.symmetric(horizontal: 16),
          labelColor: bluePrimary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          indicatorPadding: EdgeInsets.zero,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: bluePrimary, width: 2.0),
          ),
          labelStyle: styleTitle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: grayText,
          unselectedLabelStyle: styleTitle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          tabs: [
            Tab(
              child: Text(
                "KRS",
                style:
                TextStyle(fontSize: setFontSize(40), fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "LIST KRS",
                style:
                TextStyle(fontSize: setFontSize(40), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      pinned: true,
    );
  }
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
