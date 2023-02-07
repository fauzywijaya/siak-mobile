
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class CustomExpansionRecap extends StatelessWidget {
  final String numeric;
  const CustomExpansionRecap({
    required this.numeric,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: bluePrimary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text("Semester $numeric", style: styleTitle.copyWith(color: whiteSecondary, fontSize: 16),),
              textColor: whitePrimary,
              collapsedTextColor: whitePrimary,
              iconColor: whitePrimary,
              collapsedIconColor: whitePrimary,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tahun Akademik", style: styleSubtitle.copyWith(fontSize: 15, color: grayText),),
                            Text("2019/2020", style: styleTitle.copyWith(fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tagihan", style: styleSubtitle.copyWith(fontSize: 15, color: grayText),),
                            Text("Rp. 5.000.000", style: styleTitle.copyWith(fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pembayaran", style: styleSubtitle.copyWith(fontSize: 15, color: grayText),),
                            Text("Rp. 5.000.000", style: styleTitle.copyWith(fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Persentase Pembayaran", style: styleSubtitle.copyWith(fontSize: 15, color: grayText),),
                            Text("100 %", style: styleTitle.copyWith(fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tunggakan", style: styleSubtitle.copyWith(fontSize: 15, color: grayText),),
                            Text("Rp. 0", style: styleTitle.copyWith(fontSize: 16),),
                          ],
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
