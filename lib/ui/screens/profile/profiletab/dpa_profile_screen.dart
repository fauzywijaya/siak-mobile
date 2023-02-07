
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/profile_text_widget.dart';

class DpaProfileScreen extends StatelessWidget {
  const DpaProfileScreen({Key? key}) : super(key: key);

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
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "DPA",
                  style: TextStyle(
                    color: blackPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ProfileTextWidget(title: "Nama DPA ", values: "Nama DPA Mahasiswa"),
                  ProfileTextWidget(title: "No Hp DPA", values: "-"),
                ],
              ),
            ),
              ]
        ),
      ),
    );
  }
}
