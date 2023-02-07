import 'package:siak_app/core/model/api/api_result_model.dart';

class NewsModel extends Serializable {
  final List<NewsDataModel>? data;

  NewsModel({required this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      data: json['data'] != null
          ? (json['data'] as List).map((e) => NewsDataModel.fromJson(e)).toList()
          : null,
    );
  }

  factory NewsModel.failure() => NewsModel(
        data: [],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}

class NewsDataModel extends Serializable {
  NewsDataModel({
    required this.createdAt,
    required this.title,
    required this.content,
    required this.author,
    required this.id,
  });

  final String createdAt;
  final String title;
  final String content;
  final String author;
  final String id;

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
        createdAt: json["createdAt"] ?? "",
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        author: json["author"] ?? "",
        id: json["id"] ?? "",
      );

  factory NewsDataModel.failure() => NewsDataModel(
        createdAt: "",
        title: "",
        content: "",
        author: "",
        id: "",
      );

  @override
  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "title": title,
        "content": content,
        "author": author,
        "id": id,
      };
}
