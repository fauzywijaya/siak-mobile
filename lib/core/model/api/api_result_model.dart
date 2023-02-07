class ApiResult<T extends Serializable> {
  String? message;
  String? errors;
  T data;
  ApiResult({required this.message, required this.errors, required this.data});

  factory ApiResult.fromJson(Map<String, dynamic>? json, Function(Map<String, dynamic>) create) {
    return ApiResult(
      message: json?['message'] ?? '',
      errors: json?['errors'] ?? '',
      data: json != null ? create(json) : create({}),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': errors,
        'data': data.toJson(),
      };
}

class ApiResultList<T extends Serializable> {
  String? message;
  String? errors;
  List<T>? data;

  ApiResultList({required this.message, required this.errors, required this.data});

  factory ApiResultList.fromJson(List<dynamic>? json, Function(List<dynamic>) build) {
    return ApiResultList<T>(
      message: "",
      errors: "",
      data: json != null ? build(json) : build([]),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors,
        "data": data?.toList(),
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
