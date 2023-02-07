

import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/router/route_list.dart';

class MenuPaymentModel {
  String title;
  String icon;
  String navigator;
  bool isAktif;
  MenuPaymentModel(this.title, this.icon, this.navigator, this.isAktif);
}

var menuPaymentModel = [
    MenuPaymentModel("Virtual Account", Assets.icons.iconCardVa.path, routePaymentVirtualAccount, true),
    MenuPaymentModel("Rekap Pembayaran", Assets.icons.iconTranscript.path, routePaymentRekap, true),
    MenuPaymentModel("Pedoman Pembayaran", Assets.icons.iconBook.path, routePayment, false),
    MenuPaymentModel("Biaya Kuliah", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Biaya UTS/UAS", Assets.icons.iconTranscript.path, routePayment, false),
    MenuPaymentModel("Pembayaran PMB", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Pembayaran UTS/UAS", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Pembayaran Kuliah", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Pembayaran Bahasa Asing", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("PKL/KP/MAGANG", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("PLP", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Pembayaran KKN", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Tugas Akhir/ Skripsi/ Tesis", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Konfirmasi Pembayaran", Assets.icons.iconCardVa.path, routePayment, false),
    MenuPaymentModel("Hotline Keuangan", Assets.icons.iconCardVa.path, routePayment, false),
];
