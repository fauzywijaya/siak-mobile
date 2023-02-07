import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/screens/lectures/ipk/ipk_screen.dart';

class ChartWidget extends StatelessWidget {
  final List<IPK> data;

  ChartWidget({ required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<IPK, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (IPK series, _) => series.semester,
          measureFn: (IPK series, _) => series.ipk,
          colorFn: (IPK series, _) => series.barColor
      )
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      color: whiteSecondary,
      child: Card(
        color: whiteSecondary,
        elevation: 0,
        child: Expanded(
          child: charts.BarChart(series, animate: true),
        ),
      ),
    );
  }
}
