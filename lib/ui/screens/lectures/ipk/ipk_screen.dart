import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart' as chart;
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/chart_widget.dart';
class IpkScreen extends StatefulWidget {
  const IpkScreen({Key? key}) : super(key: key);

  @override
  State<IpkScreen> createState() => _IpkScreenState();
}

class _IpkScreenState extends State<IpkScreen> {


  Future<void> refreshHome(BuildContext context) async {
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IP Semester'),
        backgroundColor: whiteSecondary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer<ConnectionProvider>(
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

Widget _buildContent(BuildContext context) {
  final List<IPK> data = [
    IPK(
      semester: '1',
      ipk: 3.5,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '2',
      ipk: 3.2,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '3',
      ipk: 3.3,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '4',
      ipk: 3.7,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '5',
      ipk: 3.8,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '6',
      ipk: 3.4,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '7',
      ipk: 3.0,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
    IPK(
      semester: '8',
      ipk: 4.0,
      barColor: chart.ColorUtil.fromDartColor(bluePrimary),
    ),
  ];

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Grafik Index Prestasi Semester", style: styleTitle.copyWith(fontWeight: FontWeight.bold, fontSize: 19),),
          ChartWidget(data: data),
          const SizedBox(height: 15,),
          Text("Detail", style: styleTitle.copyWith(fontWeight: FontWeight.bold, fontSize: 19)),
          const SizedBox(height: 15,),
          _buildContainer(context)
        ],
      ),
    ),
  );
}

Widget _buildContainer(BuildContext context){
  return DecoratedBox(
    decoration: BoxDecoration(
        color: bluePrimary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ]
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Positioned(
            top: -200,
            right: -150,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: -150,
            left: -70,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.33,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("IP Semester", style: TextStyle(color: whiteSecondary, fontSize: 16),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("IP Semester 1", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                        Spacer(),
                        Text("3.5", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("IP Semester 2", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                        Spacer(),
                        Text("3.2", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("IP Semester 3", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                        Spacer(),
                        Text("3.3", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text("IP Semester 4", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                        Spacer(),
                        Text("3.7", style: TextStyle(color: whiteSecondary, fontSize: 14),),
                      ],
                    ),

                  ]
              ),
            ),
          ),
        ],
      ),
    ),
  );
}




class IPK {
  final String semester;
  final double ipk;
  final chart.Color barColor;
  IPK({
    required this.semester,
    required this.ipk,
    required this.barColor
  });
}