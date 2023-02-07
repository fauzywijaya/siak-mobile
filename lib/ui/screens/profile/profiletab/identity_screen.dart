import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/widgets/profile_text_widget.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSecondary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Consumer<LoginProvider>(builder: (context, data, _) {
          return ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Wrap(
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
                      title: Text(
                        "Identitas",
                        style: TextStyle(
                          color: blackPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ProfileTextWidget(
                          title: "NIM ",
                          values: data.mahasiswaData?.attributes?.nim ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Nama Lengkap ",
                          values: data.mahasiswaData?.attributes?.nama ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Tempat Lahir ",
                          values: data.mahasiswaData?.attributes?.tempatLahir ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Tanggal Lahir ",
                          values: data.mahasiswaData?.attributes?.tanggalLahir ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Jenis Kelamin",
                          values: (data.mahasiswaData?.attributes?.jenisKelamin ?? "") == "L"
                              ? "Laki - Laki"
                              : "Perempuan",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
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
                      title: Text(
                        "Alamat",
                        style: TextStyle(
                          color: blackPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ProfileTextWidget(
                          title: "Alamat Lengkap",
                          values: data.mahasiswaData?.attributes?.alamatRumah ?? "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
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
                      title: Text(
                        "PMB",
                        style: TextStyle(
                          color: blackPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ProfileTextWidget(
                          title: "Tahun Masuk",
                          values: data.mahasiswaData?.attributes?.tahunMasuk ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Jenis Pendaftaran",
                          values: "Kosong",
                        ),
                        ProfileTextWidget(
                          title: "Jalur Masuk",
                          values: "Non Tes",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
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
                      title: Text(
                        "Program Studi",
                        style: TextStyle(
                          color: blackPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ProfileTextWidget(
                          title: "Program Studi",
                          values: data.mahasiswaData?.relationships?.prodi?.attributes.nama ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Kelas",
                          values: data.mahasiswaData?.relationships?.kelas?.attributes.nama ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Status",
                          values: data.mahasiswaData?.relationships?.status?.attributes.nama ?? "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
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
                      title: Text(
                        "Kontak",
                        style: TextStyle(
                          color: blackPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        ProfileTextWidget(
                          title: "No Handphone",
                          values: data.mahasiswaData?.attributes?.hpPribadi ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Email",
                          values: data.mahasiswaData?.attributes?.email ?? "",
                        ),
                        ProfileTextWidget(
                          title: "Email UMMI",
                          values: data.mahasiswaData?.attributes?.emailUmmmi ?? "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
