



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

class CustomCardDashboard extends StatelessWidget {
  final String name;
  final String gender;

  CustomCardDashboard({
    required this.name,
    required this.gender
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      decoration:
      BoxDecoration(color: blueSecondary, borderRadius: BorderRadius.circular(20.0), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(3, 3),
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: whitePrimary,
                        shape: BoxShape.rectangle),
                    child: SvgPicture.asset(
                      (gender == "L") ? Assets.images.boyAvatar.path : Assets.images.girlAvatar.path,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            color: whitePrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.nunitoSans,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: whitePrimary,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.nunitoSans,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 45.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: whitePrimary,
                        shape: BoxShape.rectangle),
                    child: Center(
                      child: Text(
                        "3.00",
                        style: TextStyle(
                          color: blackPrimary,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Anda Mempunyai Tunggakan Sebesar Rp. 1.000.000",
                  style: TextStyle(
                    color: whitePrimary,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width * 0.7,
                  animation: true,
                  lineHeight: 10.0,
                  animationDuration: 2000,
                  percent: 0.6,
                  barRadius: const Radius.circular(6.0),
                  progressColor: yellowPrimary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}