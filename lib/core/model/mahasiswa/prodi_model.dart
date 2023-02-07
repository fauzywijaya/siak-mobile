


import 'package:siak_app/core/model/api/api_result_model.dart';

class ProdiModel extends Serializable {
  final String? id;
  final String? type;
  final ProdiAttributesModel attributes;

  ProdiModel({
    required this.id,
    required this.type,
    required this.attributes
  });

  factory ProdiModel.fromJson(Map<String, dynamic> json) {
    return ProdiModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: ProdiAttributesModel.fromJson(json['attributes'] ?? {}),
    );
  }

  factory ProdiModel.failure()
  => ProdiModel(
    id: "",
    type: "",
    attributes: ProdiAttributesModel.failure(),
  );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes.toJson()
    };
  }

}

class ProdiAttributesModel extends Serializable {
  final String? nama;
  final String? email;
  final String? pendirian;
  final String? statusAkreditasi;
  final String? kodeDikti;

  ProdiAttributesModel({
    required this.nama,
    required this.email,
    required this.pendirian,
    required this.statusAkreditasi,
    required this.kodeDikti
  });

  factory ProdiAttributesModel.fromJson(Map<String, dynamic> json) {
    return ProdiAttributesModel(
        nama: json['nama'] ?? "",
        email: json['email'] ?? "",
        pendirian: json['pendirian'] ?? "",
        statusAkreditasi: json['status_akreditasi'] ?? "",
        kodeDikti: json['kode_dikti'] ?? ""
    );
  }

  factory ProdiAttributesModel.failure() => ProdiAttributesModel(
      nama: "",
      email: "",
      pendirian: "",
      statusAkreditasi: "",
      kodeDikti: ""
  );



  @override
  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'pendirian': pendirian,
      'status_akreditasi': statusAkreditasi,
      'kode_dikti': kodeDikti
    };
  }
}
