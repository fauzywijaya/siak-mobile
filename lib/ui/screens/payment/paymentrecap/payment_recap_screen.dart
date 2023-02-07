

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/custom_expansion_recap.dart';
import 'package:siak_app/ui/widgets/profile_text_widget.dart';

class PaymentRecapScreen extends StatelessWidget {
  const PaymentRecapScreen({Key? key}) : super(key: key);
  
  Future<void> refreshHome(BuildContext context) async{
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekap Pembayaran'),
        elevation: 0,
        backgroundColor: whiteSecondary,
      ),
      body: SafeArea(
        child: Consumer<ConnectionProvider>(
            builder: (context, connectionProv, _) {
              switch (connectionProv.internetConnected){
                case true:
                  return (connectionProv.isLoading) ? Center(
                    child: LoadingAnimationWidget.inkDrop(
                      size: 100,
                      color: Colors.white,
                    ),
                  ) : _buildContent(context);
                case false:
                  return Center(
                    child: ErrorPlaceHolder(
                      animation: Assets.images.illustrationNoConnection.path,
                      text: 'Ops! Sepertinya koneksi internetmu dalam masalah',
                      hasButton: true,
                      buttonText: 'Refresh',
                      onButtonTap: () async{
                        refreshHome(context);
                        ConnectionProvider.instance(context).setLoading(true);
                        await Future.delayed(const Duration(seconds: 2), () {
                          ConnectionProvider.instance(context).setLoading(false);
                        });
                      },
                    ),
                  );
                default:
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                      size: 100,
                      color: Colors.white,
                    ),
                  );
              }
            }
        ),
      ),
    );
  }
}

Widget _buildContent(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    physics: const ClampingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: whiteSecondary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Consumer<LoginProvider>(
                builder: (context, data, _) {
                  return Column(
                    children: [
                      ProfileTextWidget(title: "Nim", values: data?.mahasiswaData?.attributes?.nim ?? ""),
                      ProfileTextWidget(title: "Nama", values: data?.mahasiswaData?.attributes?.nama ?? ""),
                      ProfileTextWidget(title: "Prodi", values: data?.mahasiswaData?.relationships?.prodi?.attributes.nama ?? ""),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: bluePrimary,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        ),
                        child: SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Status", style: TextStyle(color: grayText, fontSize: 13),),
                                    Text(data.mahasiswaData?.relationships?.status?.attributes.nama ?? "", style: TextStyle(color: whiteSecondary, fontSize: 16),),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Tahun Masuk", style: TextStyle(color: grayText, fontSize: 13),),
                                    Text(data.mahasiswaData?.attributes?.tahunMasuk ?? "", style: TextStyle(color: whiteSecondary, fontSize: 16),),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Kelas", style: TextStyle(color: grayText, fontSize: 13),),
                                    Text(data.mahasiswaData?.relationships?.kelas?.attributes.nama ?? "", style: TextStyle(color: whiteSecondary, fontSize: 16),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
          const SizedBox(height: 15,),
          Text("Rekap Pembayaran PMB", style: styleTitle.copyWith(fontWeight: FontWeight.bold, fontSize: 19)),
          const SizedBox(height: 15,),
          DecoratedBox(decoration: BoxDecoration(
            color: whitePrimary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tagihan", style: styleSubtitle  .copyWith(fontSize: 14, color: grayText),),
                      Text("Rp. 5.000.000", style: styleTitle.copyWith(fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pembayaran", style: styleSubtitle.copyWith(fontSize: 14, color: grayText),),
                      Text("Rp. 5.000.000", style: styleTitle.copyWith(fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Persentase Pembayaran", style: styleSubtitle.copyWith(fontSize: 14, color: grayText),),
                      Text("100 %", style: styleTitle.copyWith(fontSize: 16),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tunggakan", style: styleSubtitle.copyWith(fontSize: 14, color: grayText),),
                      Text("Rp. 1.000.000", style: styleTitle.copyWith(fontSize: 16),),
                    ],
                  ),
                ],

              ),
            ),),
          const SizedBox(height: 15,),
          Text("Rekap Tunggakan Kuliah", style: styleTitle.copyWith(fontWeight: FontWeight.bold, fontSize: 19)),
          const SizedBox(height: 15,),
          ListView.builder(itemBuilder: (context, index){
            return CustomExpansionRecap(
              numeric: (index + 1).toString(),
            );
          },
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),

        ],
      ),
    ),
  );
}
