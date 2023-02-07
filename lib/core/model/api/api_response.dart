class APIResponse {
  final int? statusCode;
  final Map<String, dynamic>? data;

  APIResponse({required this.statusCode, required this.data});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      statusCode: json['status_code'] ?? "",
      data: json['data'] ?? "",
    );
  }

  factory APIResponse.failure(int code) {
    return APIResponse(
      statusCode: code,
      data: null,
    );
  }
}
