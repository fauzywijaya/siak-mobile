
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/router/route_list.dart';

class MenuLecturesModel {
  String title;
  String icon;
  String navigator;
  bool isAktif;
  MenuLecturesModel(this.title, this.icon, this.navigator, this.isAktif);
}

// make a list from model above
var menuLecturesModel = [
    MenuLecturesModel("Kontrak Kuliah", Assets.icons.iconCollage.path, routeLecturesKrs, true),
    MenuLecturesModel("IP Semester", Assets.icons.iconIp.path, routeLecturesIpk, true),
    MenuLecturesModel("Pesan DPA", Assets.icons.iconDpa.path, routeLecturesDpa, false),
    MenuLecturesModel("Pedoman", Assets.icons.iconBook.path, routeLecturesKrs, false),
    MenuLecturesModel("Hasil Studi", Assets.icons.iconResultCard.path, routeLecturesKrs, false),
    MenuLecturesModel("Teman Sekelas", Assets.icons.iconTeman.path, routeLecturesKrs, false),
    MenuLecturesModel("Traskrip", Assets.icons.iconTranscript.path, routeLecturesKrs, false),
    MenuLecturesModel("Jadwal", Assets.icons.iconJadwal.path, routeLecturesKrs, false),
    MenuLecturesModel("Cetak Kartu", Assets.icons.iconPrint.path, routeLecturesKrs, false),
    MenuLecturesModel("Pengajuan SKAK", Assets.icons.iconSkak.path, routeLecturesKrs, false),
];
