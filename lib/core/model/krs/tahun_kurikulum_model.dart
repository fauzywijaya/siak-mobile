

import 'package:siak_app/core/model/api/api_result_model.dart';

class TahunKurikulumModel extends Serializable {
  final String? id;
  final String? type;
  final TahunKurikulumAttributesModel attributes;

  TahunKurikulumModel({
    required this.id,
    required this.type,
    required this.attributes
  });

  factory TahunKurikulumModel.fromJson(Map<String, dynamic> json) {
    return TahunKurikulumModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: TahunKurikulumAttributesModel.fromJson(json['attributes'] ?? {}),
    );
  }

  factory TahunKurikulumModel.failure()
    => TahunKurikulumModel(
      id: "",
      type: "",
      attributes: TahunKurikulumAttributesModel.failure(),
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

class TahunKurikulumAttributesModel extends Serializable {
  final String? name;

  TahunKurikulumAttributesModel({required this.name});

  factory TahunKurikulumAttributesModel.fromJson(Map<String, dynamic> json) {
    return TahunKurikulumAttributesModel(
      name: json['name'] ?? "",
    );
  }

  factory TahunKurikulumAttributesModel.failure()
    => TahunKurikulumAttributesModel(
      name: "",
    );

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}