import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';

class OnBoardingSlider extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  OnBoardingSlider({
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: setWidth(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: setHeight(600),
            width: setWidth(600),
            child: Image.asset(imageAsset),
          ),
          Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.75),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
