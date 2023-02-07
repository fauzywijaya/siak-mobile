


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

class ErrorPlaceHolder extends StatelessWidget {
  final String animation;
  final String text;
  final bool hasButton;
  final String? buttonText;
  final Function()? onButtonTap;
  const ErrorPlaceHolder({
    Key? key,
    required this.animation,
    required this.text,
    this.hasButton = false,
    this.buttonText,
    this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            animation,
            width: 180.0,
            height: 180.0,
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            width: 280.0,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: bluePrimary, fontWeight: FontWeight.w500, fontFamily: FontFamily.nunitoSans),
            ),
          ),
          const SizedBox(height: 18.0),
          hasButton
              ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bluePrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 14.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: onButtonTap,
              child: Text(
              buttonText ?? '',
              style: TextStyle(fontSize: 18, color: whitePrimary, fontWeight: FontWeight.w500, fontFamily: FontFamily.nunitoSans)
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}