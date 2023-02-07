


import 'package:siak_app/core/model/api/api_result_model.dart';

class StatusModel extends Serializable {
  final String? id;
  final String? type;
  final StatusAttributesModel attributes;

  StatusModel({
    required this.id,
    required this.type,
    required this.attributes
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: StatusAttributesModel.fromJson(json['attributes'] ?? {}),
    );
  }

  factory StatusModel.failure()
  => StatusModel(
    id: "",
    type: "",
    attributes: StatusAttributesModel.failure(),
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



class StatusAttributesModel extends Serializable {
  final String? nama;
  StatusAttributesModel({
    required this.nama
  });

  factory StatusAttributesModel.fromJson(Map<String, dynamic> json){
    return StatusAttributesModel(
        nama: json['nama'] ?? ""
    );
  }

  factory StatusAttributesModel.failure()
  => StatusAttributesModel(
    nama: "",
  );

  @override
  Map<String, dynamic> toJson() {
    return {
      "nama": nama
    };
  }

}

