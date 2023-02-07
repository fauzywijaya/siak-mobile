

import 'package:siak_app/core/model/api/api_response.dart';

abstract class BaseAPIImpl {
  Future<APIResponse> get(String url, {Map<String, dynamic>? params, bool? useToken});
  Future<APIResponse> post(String url, {Map<String, dynamic>? params, dynamic data, bool? useToken});
  Future<APIResponse> put(String url, {Map<String, dynamic>? params, dynamic data, bool? useToken});
  Future<APIResponse> delete(String url, {Map<String, dynamic>? params, bool? useToken});
}