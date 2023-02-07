import 'package:siak_app/core/model/api/api_result_model.dart';

class MataKuliahModel extends Serializable {
  final String? id;
  final String? type;
  final MataKuliahAttributesModel attributes;

  MataKuliahModel({required this.id, required this.type, required this.attributes});

  factory MataKuliahModel.fromJson(Map<String, dynamic> json) {
    return MataKuliahModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: MataKuliahAttributesModel.fromJson(json['attributes'] ?? {}),
    );
  }

  factory MataKuliahModel.failure() => MataKuliahModel(
        id: "",
        type: "",
        attributes: MataKuliahAttributesModel.failure(),
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes,
    };
  }
}

class MataKuliahAttributesModel extends Serializable {
  final String? kode;
  final String? nama;
  final int? semester;
  final int? sks;

  MataKuliahAttributesModel(
      {required this.kode, required this.nama, required this.semester, required this.sks});

  factory MataKuliahAttributesModel.fromJson(Map<String, dynamic> json) {
    return MataKuliahAttributesModel(
      kode: json['kode'] ?? "",
      nama: json['nama'] ?? "",
      semester: json['semester'] ?? 0,
      sks: json['sks'] ?? 0,
    );
  }

  factory MataKuliahAttributesModel.failure() => MataKuliahAttributesModel(
        kode: "",
        nama: "",
        semester: 0,
        sks: 0,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'kode': kode,
      'nama': nama,
      'semester': semester,
      'sks': sks,
    };
  }
}
