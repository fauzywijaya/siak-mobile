import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/utils/navigation_utils.dart';

import '../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteSecondary,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildExpandedLogo(context),
              _buildExpandedText(context),
            ],
          ),
        )
    );
  }


  Widget _buildExpandedLogo(BuildContext context){
    return Expanded(
      flex: 7,
      child: AnimatedOpacity(
        opacity: opacityLogo,
        duration: const Duration(seconds: 1),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: bluePrimary,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: Image.asset(
              Assets.images.logoUMMI.path,
              width: deviceWidth * 1.0,
              height: setHeight(1000),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedText(BuildContext context){
    return Expanded(
      flex: 3,
      child: AnimatedOpacity(
          opacity: opacityText,
          duration: const Duration(milliseconds: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIAK',
                style: TextStyle(
                    color: blackPrimary,
                    fontSize: setFontSize(100),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Universitas Muhammadiyah Sukabumi',
                style: TextStyle(
                    color: blackPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
      ),
    );
  }

  double opacityLogo = 0;
  double opacityText = 0;

  void initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacityLogo = 1;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      opacityText = 1;
    });
    await Future.delayed(const Duration(seconds: 2));
    navigate.pushToRemoveUntil(routeLogin);
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

}
