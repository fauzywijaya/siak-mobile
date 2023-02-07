
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/custom_dialog.dart';
import 'package:siak_app/utils/navigation_utils.dart';

class CustomMenu extends StatelessWidget {
  final String title;
  final String icon;
  final double height;
  final bool active;
  // final Function() onPressed
  final String destination;
  CustomMenu({
  required this.title,
    required this.height,
  required this.icon,
    required this.active,
  required this.destination
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(active){
          navigate.pushTo(destination);
        }else {
          showDialog(
              context: context,
              builder: (context) =>
                  CustomDialog(
                    title: Text(
                      'Fitur ini sedang dalam tahap pengembangan',
                      style: TextStyle(
                          color: grayText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    content: SvgPicture.asset(
                      Assets.images.illustrationDevelopment.path,
                      height: 200,
                    ),
                  ));
        }
      },
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: height,
        decoration: BoxDecoration(
          color: (active) ? Colors.white : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: bluePrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
