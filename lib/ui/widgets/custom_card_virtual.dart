import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

class CustomCardVirtual extends StatelessWidget {
  final String index;
  final String? nim;
  final String? id;
  final String? name;
  CustomCardVirtual({
    required this.index,
    required this.nim,
    required this.id,
    required this.name,
  });


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: cyanPrimary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: -200,
              right: -180,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
              ),
            ),
            Positioned(
              top: -100,
              right: -225,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40.0,
                              height: 30.0,
                              padding: const EdgeInsets.all(7.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.rectangle),
                              child:   SvgPicture.asset(
                                Assets.icons.iconSimcard.path,
                                width: 14,
                                height: 14,
                              )
                            ),
                            SvgPicture.asset(
                              Assets.icons.iconBsi.path,
                              width: 30,
                              height: 30,
                            )
                          ]
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$index $nim", style: styleTitle.copyWith(fontSize: 16, color: Colors.white),),
                          Text("Via Teller Bsi", style: styleTitle.copyWith(fontSize: 11, color: grayPrimary),),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("900 9072 $index $id ", style: styleTitle.copyWith(fontSize: 16, color: Colors.white),),
                          Text("Via ATM / Mobile Banking / Internet Banking", style: styleTitle.copyWith(fontSize: 11, color: grayPrimary),),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Pembayaran $name", style: styleTitle.copyWith(fontSize: 14, color: Colors.white)),
                        ],
                      )
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
