import 'package:siak_app/core/model/api/api_result_model.dart';
import 'package:siak_app/core/model/krs/tahun_kurikulum_model.dart';

class TahunAkademiKModel extends Serializable {
  final String? id;
  final String? type;
  final TahunAkademiKAttributesModel attributes;
  final TahunKurikulumModel? relationships;

  TahunAkademiKModel(
      {required this.id,
      required this.type,
      required this.attributes,
      required this.relationships});

  factory TahunAkademiKModel.fromJson(Map<String, dynamic> json) {
    return TahunAkademiKModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: TahunAkademiKAttributesModel.fromJson(json['attributes'] ?? {}),
      relationships: TahunKurikulumModel.fromJson(json['relationships'] ?? {}),
    );
  }

  factory TahunAkademiKModel.failure() => TahunAkademiKModel(
        id: "",
        type: "",
        attributes: TahunAkademiKAttributesModel.failure(),
        relationships: TahunKurikulumModel.failure(),
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

class TahunAkademiKAttributesModel extends Serializable {
  final String? nama;
  final bool? aktif;

  TahunAkademiKAttributesModel({required this.nama, required this.aktif});

  factory TahunAkademiKAttributesModel.fromJson(Map<String, dynamic> json) {
    return TahunAkademiKAttributesModel(
      nama: json['nama'] ?? "",
      aktif: json['aktif'] ?? false,
    );
  }

  factory TahunAkademiKAttributesModel.failure() => TahunAkademiKAttributesModel(
        nama: "",
        aktif: false,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'aktif': aktif,
    };
  }
}
