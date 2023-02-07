

import 'package:flutter/material.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';

class CustomExpansionKrs extends StatelessWidget {
  String lessonName;
  int semester;
  int sks;
  String kodeMK;
  String? tahunAkademik;
  CustomExpansionKrs({
  required this.lessonName,
  required this.semester,
  required this.sks,
  required this.kodeMK,
    this.tahunAkademik,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: grayPrimary,
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
              title: Text(lessonName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: blackPrimary, fontFamily: FontFamily.nunitoSans),),
              textColor: blackPrimary,
              collapsedTextColor: blackPrimary,
              iconColor: blackPrimary,
              collapsedIconColor: blackPrimary,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: graySecondary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4.0)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Kode MK", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans),),
                            Text(kodeMK, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Semester", style:TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans)),
                            Text((semester % 2 == 0) ? "${semester} (Genap)" : "${semester} (Ganjil)"  , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("SKS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans),),
                            Text(sks.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        (tahunAkademik != null) ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tahun Akademik", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans),),
                            Text(tahunAkademik!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: blackPrimary, fontFamily: FontFamily.nunitoSans)),
                          ],
                        ) : SizedBox(),
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
