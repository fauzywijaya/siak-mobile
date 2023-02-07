
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/custom_dialog.dart';

class ListDpaWidget extends StatelessWidget {
  final String date;
  final String title;
  final String content;

  ListDpaWidget({
    required this.date,
    required this.title,
    required this.content,
  });

  //
  // String jsonDate = '2022-01-01T00:00:00.000Z';



  @override
  Widget build(BuildContext context) {
    DateTime jsondate = DateTime.parse(date);
    String formattedDate = DateFormat('dd/MM/yyyy').format(jsondate);
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) => CustomDialog(
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
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [

            Text(formattedDate,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w200,
                  fontFamily: FontFamily.nunitoSans,
                  color: grayText
              ),
            ),
            Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.nunitoSans,
                  color: blackPrimary
              ),
            ),
            Text(content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.nunitoSans,
                  color: grayText
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
