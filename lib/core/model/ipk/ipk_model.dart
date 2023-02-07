


import 'package:community_charts_flutter/community_charts_flutter.dart' as chart;
import 'package:siak_app/ui/constant/constant.dart';

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

final List<IPK> dataIpk = [
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