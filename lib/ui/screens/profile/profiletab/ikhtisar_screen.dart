
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/ui/widgets/custom_dialog.dart';
import 'package:siak_app/utils/navigation_utils.dart';

class IkhtisarScreen extends StatelessWidget {
  const IkhtisarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: whiteSecondary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  color: yellowPrimary,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]
              ),
              child: Consumer<LoginProvider>(
                builder: (context, data, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: data.mahasiswaData?.attributes?.nama,
                        style: TextStyle(
                            color: blackPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.nunitoSans),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' adalah Mahasiswa Universitas Muhammadiyah Sukabumi dari Program Studi ',
                            style: TextStyle(
                                color: blackPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: FontFamily.nunitoSans),
                          ),
                          TextSpan(
                            text: data?.mahasiswaData?.relationships?.prodi?.attributes.nama ?? "",
                            style: TextStyle(
                                color: blackPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.nunitoSans),
                          ),
                          TextSpan(
                            text: " yang masuk tahun ",
                            style: TextStyle(
                                color: blackPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: FontFamily.nunitoSans),
                          ),
                          TextSpan(
                            text: data?.mahasiswaData?.attributes?.tahunMasuk ?? "",
                            style: TextStyle(
                                color: blackPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.nunitoSans),
                          ),
                          TextSpan(
                            text: " dan kini berstatus ",
                            style: TextStyle(
                                color: blackPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: FontFamily.nunitoSans),
                          ),
                          TextSpan(
                            text: data.mahasiswaData?.relationships?.status?.attributes?.nama ?? "" ,
                            style: TextStyle(
                                color: blackPrimary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.nunitoSans),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              // ignore: sort_child_properties_last
              child: Text(
                'Lihat KTM',
                style: TextStyle(
                  color: whitePrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: bluePrimary,
                minimumSize: const Size.fromHeight(30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
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
              },
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              // ignore: sort_child_properties_last
              child: Text(
                'Ubah Profile',
                style: TextStyle(
                  color: whitePrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: bluePrimary,
                minimumSize: const Size.fromHeight(30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
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
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              // ignore: sort_child_properties_last
              child: Text(
                'Keluar',
                style: TextStyle(
                  color: whitePrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: bluePrimary,
                minimumSize: const Size.fromHeight(30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                navigate.pustToReplacement(routeLogin);
                ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
                final snackBarError = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Keluar',
                    message: 'Terima Kasih',
                    contentType: ContentType.help,
                  ),
                );
                scaffoldMessenger
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBarError);
                // navigate.pustToReplacement(routeHome);
              },
            ),
          ],
        ),
      ),
    );
  }
}
