

import 'package:flutter/material.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

class ProfileTextWidget extends StatelessWidget {
  final String title;
  final String values;

  ProfileTextWidget({
    required this.title,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 3,),
          Text(
            title,
            style: TextStyle(
              color: grayText,
              fontSize: 13,
              fontWeight: FontWeight.w200,
            ),
          ),
          Text(
            values,
            style: TextStyle(
              color: blackPrimary,
              fontSize: 15,
              fontFamily: FontFamily.nunitoSans,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: grayText,
            thickness: 1,
          ),
        ],

      ),
    );
  }
}
