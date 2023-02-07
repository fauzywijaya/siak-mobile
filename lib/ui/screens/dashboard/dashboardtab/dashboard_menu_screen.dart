import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/ui/widgets/menu_akses.dart';
import 'package:siak_app/utils/navigation_utils.dart';

class DashboardMenuScreen extends StatelessWidget {
  const DashboardMenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSecondary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
              children:[
                _buildRowOne(context),
                _buildRowTwo(context),
                _buildRowThree(context),
              ]
          ),
        ),
      ),
    );
  }
}


Widget _buildRowOne(BuildContext context){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MenuAkses(name: "LMS", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://lms.ummi.ac.id/");
      }, icon: HeroIcons.computerDesktop),
      MenuAkses(name: "Pendaftaran Email Ummi", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://webmail.ummi.ac.id/mahasiswa/login");
      }, icon: HeroIcons.map),
      MenuAkses(name: "Pendaftaran Wifi Ummi", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://wifi.ummi.ac.id/mahasiswa/login");
      }, icon: HeroIcons.wifi),
    ],
  );
}

Widget _buildRowTwo(BuildContext context){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MenuAkses(name: "Nilai Mentoring BTQ", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://aik.ummi.ac.id/mahasiswa");
      }, icon: HeroIcons.bookOpen),
      MenuAkses(name: "OK3S", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://ok3s.perpustakaan.ummi.ac.id/");
      }, icon: HeroIcons.check),
      MenuAkses(name: "Zona Prestasi Mahasiswa", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://zopres.ummi.ac.id/");
      }, icon: HeroIcons.trophy),
    ],
  );
}

Widget _buildRowThree(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MenuAkses(name: "Sistem Layanan Kemahasiswaan", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://silakem.ummi.ac.id/akun/mahasiswa/login");
      }, icon: HeroIcons.star),
      MenuAkses(name: "Katalog Perpustakaan", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://opac-perpustakaan.ummi.ac.id/index.php?p=mahasiswa");
      }, icon: HeroIcons.bookOpen),
      MenuAkses(name: "E-Complaint", onPresed: (){
        navigate.pushTo(routeWebView, data: "https://e-complaint.ummi.ac.id/home/login_mahasiswa");
      }, icon: HeroIcons.chatBubbleOvalLeftEllipsis),
    ],
  );
}
