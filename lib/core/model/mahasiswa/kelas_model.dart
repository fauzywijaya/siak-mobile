


import 'package:siak_app/core/model/api/api_result_model.dart';


class KelasModel extends Serializable {
  final String? id;
  final String? type;
  final KelasAttributesModel attributes;

  KelasModel({
    required this.id,
    required this.type,
    required this.attributes
  });

  factory KelasModel.fromJson(Map<String, dynamic> json) {
    return KelasModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: KelasAttributesModel.fromJson(json['attributes'] ?? {}),
    );
  }

  factory KelasModel.failure()
  => KelasModel(
    id: "",
    type: "",
    attributes: KelasAttributesModel.failure(),
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


class KelasAttributesModel extends Serializable {
  final String? nama;

  KelasAttributesModel({
    required this.nama
  });

  factory KelasAttributesModel.fromJson(Map<String, dynamic> json) {
    return KelasAttributesModel(nama: json['nama'] ?? "");
  }

  factory KelasAttributesModel.failure() => KelasAttributesModel(nama: "");

  @override
  Map<String, dynamic> toJson() {
    return {
      'nama': nama
    };
  }
}

