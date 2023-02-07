
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:siak_app/ui/constant/constant.dart';

class MenuAkses extends StatelessWidget {
  final String name;
  final Function() onPresed;
  final HeroIcons icon;

  MenuAkses({
    required this.name,
    required this.onPresed,
    required this.icon
});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 80.0,
            height: 80.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: bluePrimary,
                shape: BoxShape.rectangle),
            child: ElevatedButton(
              child: HeroIcon(
                icon,
                size: 60,
                color: whitePrimary,
                style: HeroIconStyle.solid,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: bluePrimary,
                foregroundColor: bluePrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: onPresed,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            name,
            style: styleTitle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: bluePrimary),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );;
  }
}
