import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/custom_dialog.dart';



class ListNewWidget extends StatelessWidget {
  final String date;
  final String title;
  const ListNewWidget({
    required this.date,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DecoratedBox(
                decoration: BoxDecoration(color: bluePrimary),
                child: Image.asset(
                  Assets.images.logoUMMI.path,
                  width: 75,
                  height: 75,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(DateTime.parse(date).toString(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: FontFamily.nunitoSans,
                        color: grayText
                    ),
                  ),
                  Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.nunitoSans,
                        color: blackPrimary
                    ),
                  ),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa",
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
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ],
        ),
      ),
     );
  }
}

// // ListTile(
// // leading:
// title: const Text('List Tile'),
// subtitle: const Text('List Tile Subtitle'),
// );
