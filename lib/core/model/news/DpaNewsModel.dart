import '../api/api_result_model.dart';

class DpaNewsModel extends Serializable {
  List<DpaNewsDataModel> data;

  DpaNewsModel({required this.data});

  factory DpaNewsModel.fromJson(Map<String, dynamic> json) {
    return DpaNewsModel(
      data: json['data'] != null
          ? (json['data'] as List).map((e) => DpaNewsDataModel.fromJson(e)).toList()
          : [],
    );
  }

  factory DpaNewsModel.failure() => DpaNewsModel(
        data: [],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}

class DpaNewsDataModel extends Serializable {
  DpaNewsDataModel({
    required this.createdAt,
    required this.title,
    required this.content,
    required this.id,
  });

  final String createdAt;
  final String title;
  final String content;
  final String id;

  factory DpaNewsDataModel.fromJson(Map<String, dynamic> json) => DpaNewsDataModel(
        createdAt: json["createdAt"] ?? "",
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        id: json["id"] ?? "",
      );

  factory DpaNewsDataModel.failure() => DpaNewsDataModel(
        createdAt: "",
        title: "",
        content: "",
        id: "",
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "title": title,
        "content": content,
        "id": id,
      };
}
