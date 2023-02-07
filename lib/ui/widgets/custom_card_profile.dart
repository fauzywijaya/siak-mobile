import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

class CustomCardProfile extends StatelessWidget {
  final String name;
  final String jurusan;
  final String nim;
  final String gender;
  const CustomCardProfile({
    required this.nim,
    required this.name,
    required this.jurusan,
    required this.gender,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: whitePrimary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.23,
                ),
                Positioned(
                  top: -140,
                  right: -80,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.2), shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  top: -60,
                  right: -60,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.3), shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    Assets.icons.lineShapeOne.path,
                    width: 50,
                    height: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: blueSecondary),
                          child: SvgPicture.asset(
                            (gender == "L") ? Assets.images.boyAvatar.path : Assets.images.girlAvatar.path,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Consumer<LoginProvider>(builder: (context, data, _) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nim,
                                  style: styleTitle.copyWith(fontSize: setFontSize(55), fontFamily: FontFamily.nunitoSans, color: bluePrimary),
                                ),
                                Text(
                                  name,
                                  style: styleTitle.copyWith(fontSize: setFontSize(50), fontFamily: FontFamily.nunitoSans, color: bluePrimary),
                                ),
                                Text(
                                  jurusan,
                                  style: styleTitle.copyWith(fontSize: setFontSize(50), fontFamily: FontFamily.nunitoSans, color: bluePrimary),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
