

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/gen/fonts.gen.dart';
import 'package:siak_app/ui/widgets/ErrorPlaceholder.dart';
import 'package:siak_app/ui/widgets/custom_card_virtual.dart';

import '../../../constant/constant.dart';

class VirtualAccountScreen extends StatelessWidget {
  const VirtualAccountScreen({Key? key}) : super(key: key);

  Future<void> refreshHome(BuildContext context) async {
    ConnectionProvider.instance(context).setConnection(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Account'),
        elevation: 0,
        backgroundColor: whiteSecondary,
      ),
      body: SafeArea(
        child: Consumer<ConnectionProvider>(
            builder: (context, connectionProv, _) {
              switch (connectionProv.internetConnected){
                case true:
                  return (connectionProv.isLoading) ?
                  Center(
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
                      onButtonTap: () async {
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


Widget _buildContent(BuildContext context){
  return ListView(
      shrinkWrap: true,
      children: [
        Consumer<LoginProvider>(builder: (context, data, _) {
          return CarouselSlider(
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                height: MediaQuery.of(context).size.height * 0.25,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false,
                initialPage: 0,
                autoPlayCurve: Curves.fastOutSlowIn),
            items: [
              CustomCardVirtual(
                  index: "00",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "PMB dan Kuliah"),
              CustomCardVirtual(
                  index: "03",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "UTS / UAS"),
              CustomCardVirtual(
                  index: "05",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "PKL / KP / Magang / PPL"),
              CustomCardVirtual(
                  index: "07",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "Wisuda"),
              CustomCardVirtual(
                  index: "08",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "Skripsi"),
              CustomCardVirtual(
                  index: "09",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "KKN Reguler"),
              CustomCardVirtual(
                  index: "10",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "KKN Nasional"),
              CustomCardVirtual(
                  index: "11",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "KKN Internasional"),
              CustomCardVirtual(
                  index: "12",
                  nim: data.mahasiswaData?.attributes?.nim ?? "",
                  id: data.mahasiswaData?.id ?? "",
                  name: "Bahasa Asing"),
            ],
          );
        }),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Keterangan ", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.bold, fontSize: 18, color: blackPrimary),),
                const SizedBox(height: 10,),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: whiteSecondary,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: blackPrimary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kode", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.bold, fontSize: 16, color: blackPrimary),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("900", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            Text("Kode BPI", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("9072", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            Text("Kode Kampus UMMI", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("00", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            Text("Kode Pembayaran PMB dan Kuliah", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("03", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            Text("Kode Pembayaran UTS", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("05", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            Text("Kode Pembayaran Lain-Lain", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("20246", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            Text("Kode Anda di SIAK", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Text("Catatan ", style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.bold, fontSize: 18, color: blackPrimary),),
                const SizedBox(height: 10,),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: whiteSecondary,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: blackPrimary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("• "),
                            Expanded(
                              child: Text("Setiap transaksi menggunakan Virtual Account ini akan dikenakan biaya admin Rp 2000 oleh Bank. Jadi pastikan jumlah yang akan anda transfer sudah ditambahkan Rp 2000.",
                                style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("• "),
                            Expanded(
                              child: Text("Sebagai contoh, ketika anda hendak melakukan transfer sebesar Rp 2.500.000 maka anda harus menambahkan Rp 2000 sehingga menjadi Rp 2.502.000.",
                                style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("• "),
                            Expanded(
                              child: Text("Silahkan lakukan proses transfer ke nomor Virtual Account diatas dan pastikan nama penerimanya adalah nama anda. Untuk beberapa jenis pembayaran bisa dicicil sesuai dengan kebutuhan",
                                style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("• "),
                            Expanded(
                              child: Text("Setelah proses transfer selesai, data pembayaran akan otomatis masuk ke SIAK anda.",
                                style: TextStyle(fontFamily: FontFamily.nunitoSans, fontWeight: FontWeight.normal, fontSize: 16, color: blackPrimary),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ) ,
        ),
      ]
  );
}