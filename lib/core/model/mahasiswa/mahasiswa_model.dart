import 'package:siak_app/core/model/api/api_result_model.dart';
import 'package:siak_app/core/model/mahasiswa/relationship_mahasiswa_model.dart';

class MahasiswaModel extends Serializable {
  final MahasiswaDataModel? data;

  MahasiswaModel({required this.data});

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      data: json['data'] != null ? MahasiswaDataModel.fromJson(json['data']) : null,
    );
  }

  factory MahasiswaModel.failure() => MahasiswaModel(
        data: MahasiswaDataModel.failure(),
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}

class MahasiswaDataModel extends Serializable {
  final String? id;
  final String? type;
  final MahasiswaAttributesModel? attributes;
  final RelationShipMahasiswaModel? relationships;

  MahasiswaDataModel({
    required this.id,
    required this.type,
    required this.attributes,
    required this.relationships,
  });

  factory MahasiswaDataModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaDataModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: MahasiswaAttributesModel.fromJson(json['attributes'] ?? {}),
      relationships: RelationShipMahasiswaModel.fromJson(json['relationships'] ?? {}),
    );
  }

  factory MahasiswaDataModel.failure() => MahasiswaDataModel(
        id: "",
        type: "",
        attributes: MahasiswaAttributesModel.failure(),
        relationships: RelationShipMahasiswaModel.failure(),
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes,
      'relationships': relationships,
    };
  }
}

class MahasiswaAttributesModel extends Serializable {
  final String? nama;
  final String? nim;
  final String? emailUmmmi;
  final String? email;
  final String? tempatLahir;
  final String? tanggalLahir;
  final String? jenisKelamin;
  final String? hpPribadi;
  final String? alamatRumah;
  final String? kodeposPribadi;
  final String? tahunMasuk;

  MahasiswaAttributesModel(
      {required this.nama,
      required this.nim,
      required this.email,
      required this.emailUmmmi,
      required this.tempatLahir,
      required this.tanggalLahir,
      required this.jenisKelamin,
      required this.hpPribadi,
      required this.alamatRumah,
      required this.kodeposPribadi,
      required this.tahunMasuk});

  factory MahasiswaAttributesModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAttributesModel(
      nama: json['nama'] ?? "",
      nim: json['nim'] ?? "",
      email: json['email'] ?? "",
      emailUmmmi: json['email_ummmi'] ?? "",
      tempatLahir: json['tempat_lahir'] ?? "",
      tanggalLahir: json['tanggal_lahir'] ?? "",
      jenisKelamin: json['jenis_kelamin'] ?? "",
      hpPribadi: json['hp_pribadi'] ?? "",
      alamatRumah: json['alamat_rumah'] ?? "",
      kodeposPribadi: json['kodepos_pribadi'] ?? "",
      tahunMasuk: json['tahun_masuk'] ?? "",
    );
  }

  factory MahasiswaAttributesModel.failure() => MahasiswaAttributesModel(
        nama: "",
        nim: "",
        email: "",
        emailUmmmi: "",
        tempatLahir: "",
        tanggalLahir: "",
        jenisKelamin: "",
        hpPribadi: "",
        alamatRumah: "",
        kodeposPribadi: "",
        tahunMasuk: "",
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'email': email,
      'email_ummmi': emailUmmmi,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'jenis_kelamin': jenisKelamin,
      'hp_pribadi': hpPribadi,
      'alamat_rumah': alamatRumah,
      'kodepos_pribadi': kodeposPribadi,
      'tahun_masuk': tahunMasuk,
    };
  }
}
