import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/data/base_api_impl.dart';
import 'package:siak_app/core/model/api/api_response.dart';
import 'package:siak_app/core/viewmodels/connection/connection_provider.dart';
import 'package:siak_app/injector.dart';
import 'package:siak_app/utils/navigation_utils.dart';

class BaseAPI implements BaseAPIImpl {
  Dio? _dio;
  final endPoint = locator<Api>();

  BaseAPI({Dio? dio}) {
    _dio = dio ?? Dio();
  }

  Options getHeaders({bool? useToken, String? token, bool? useFormData = false}) {
    var header = <String, dynamic>{};
    header['Accept'] = 'application/json';
    if (useToken == true) {
      header['Authorization'] = 'Bearer $token';
    }

    return Options(
      headers: header,
      sendTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      contentType: useFormData == true ? Headers.formUrlEncodedContentType : null,
    );
  }

  @override
  Future<APIResponse> delete(String url,
      {Map<String, dynamic>? params, bool? useToken, String? token}) async {
    try {
      final response = await _dio!.delete(
        url,
        queryParameters: params,
        options: getHeaders(useToken: useToken, token: token),
      );
      return _parseResponse(response);
    } on DioError catch (e) {
      return APIResponse.failure(e.response?.statusCode ?? 500);
    }
  }

  @override
  Future<APIResponse> get(String url,
      {Map<String, dynamic>? params, bool? useToken, String? token}) async {
    try {
      final response = await _dio!.get(
        url,
        queryParameters: params,
        options: getHeaders(useToken: useToken, token: token),
      );

      return _parseResponse(response);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        ConnectionProvider.instance(navigate.navigatorKey.currentContext!).setConnection(false);
      } else {
        if (Platform.environment.containsKey('FLUTTER_TEST') == false) {
          ConnectionProvider.instance(navigate.navigatorKey.currentContext!).setConnection(true);
        }
      }
      return APIResponse.failure(e.response?.statusCode ?? 500);
    }
  }

  @override
  Future<APIResponse> post(String url,
      {Map<String, dynamic>? params,
      data,
      bool? useToken,
      String? token,
      bool useFormData = true}) async {
    try {
      final result = await _dio?.post(url,
          options: getHeaders(useToken: useToken, token: token, useFormData: useFormData),
          data: data,
          queryParameters: params);
      return _parseResponse(result);
    } on DioError catch (e) {
      return APIResponse.failure(e.response?.statusCode ?? 500);
    }
  }

  @override
  Future<APIResponse> put(String url,
      {Map<String, dynamic>? params, data, bool? useToken, String? token}) async {
    try {
      final result = await _dio?.put(url,
          options: getHeaders(useToken: useToken, token: token),
          data: data,
          queryParameters: params);
      return _parseResponse(result);
    } on DioError catch (e) {
      return APIResponse.failure(e.response?.statusCode ?? 500);
    }
  }

  Future<APIResponse> _parseResponse(Response? response) async {
    return APIResponse.fromJson({
      'status_code': response?.statusCode,
      'data': response?.data is List ? {"data": response?.data} : response?.data,
    });
  }
}
