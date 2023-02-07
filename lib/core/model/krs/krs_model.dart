import 'package:siak_app/core/model/api/api_result_model.dart';
import 'package:siak_app/core/model/krs/relationships_krs_model.dart';

class KrsModel extends Serializable {
  final List<KrsDataModel>? data;

  KrsModel({required this.data});

  factory KrsModel.fromJson(Map<String, dynamic> json) {
    return KrsModel(
      data: json['data'] != null
          ? (json['data'] as List).map((e) => KrsDataModel.fromJson(e)).toList()
          : null,
    );
  }

  factory KrsModel.failure() => KrsModel(
        data: [],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}

class KrsDataModel extends Serializable {
  final String? id;
  final String? type;
  final KrsAttributesModel attributes;
  final RelationshipsKrsModel relationships;

  KrsDataModel(
      {required this.id,
      required this.type,
      required this.attributes,
      required this.relationships});

  factory KrsDataModel.fromJson(Map<String, dynamic> json) {
    return KrsDataModel(
      id: json['id'] ?? "",
      type: json['type'] ?? "",
      attributes: KrsAttributesModel.fromJson(json['attributes'] ?? {}),
      relationships: RelationshipsKrsModel.fromJson(json['relationships'] ?? {}),
    );
  }

  factory KrsDataModel.failure() => KrsDataModel(
        id: "",
        type: "",
        attributes: KrsAttributesModel.failure(),
        relationships: RelationshipsKrsModel.failure(),
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

class KrsAttributesModel extends Serializable {
  final String? nilai;
  final int? bobot;
  final int? semester;
  final int? status;

  KrsAttributesModel(
      {required this.nilai, required this.bobot, required this.semester, required this.status});

  factory KrsAttributesModel.fromJson(Map<String, dynamic> json) {
    return KrsAttributesModel(
      nilai: json['nilai'] ?? "",
      bobot: json['bobot'] ?? 0,
      semester: json['semester'] ?? 0,
      status: json['status'] ?? 0,
    );
  }

  factory KrsAttributesModel.failure() => KrsAttributesModel(
        nilai: "",
        bobot: 0,
        semester: 0,
        status: 0,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'nilai': nilai,
      'bobot': bobot,
      'semester': semester,
      'status': status,
    };
  }
}
