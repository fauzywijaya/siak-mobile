import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/profile_text_widget.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSecondary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: ListView(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: whitePrimary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Ayah",
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ProfileTextWidget(title: "Nama Ayah ", values: "Nama Ayah Mahasiswa"),
                  ProfileTextWidget(title: "Alamat Ayah ", values: "KP. California Wetan, 001/004"),
                  ProfileTextWidget(title: "Kota Ayah ", values: "USA Regency"),
                  ProfileTextWidget(title: "No Hp Ayah", values: "-"),
                  ProfileTextWidget(title: "No Telp Ayah", values: "-"),
                ],
              ),
            ),
            SizedBox(height: 10,),
            DecoratedBox(
              decoration: BoxDecoration(
                color: whitePrimary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Ibu",
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ProfileTextWidget(title: "Nama Ibu ", values: "Nama Ibu Mahasiswa"),
                  ProfileTextWidget(title: "Alamat Ibu ", values: "KP. California Wetan, 001/004"),
                  ProfileTextWidget(title: "Kota Ibu ", values: "USA Regency"),
                  ProfileTextWidget(title: "No Hp Ibu", values: "-"),
                  ProfileTextWidget(title: "No Hp Ibu", values: "-"),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}