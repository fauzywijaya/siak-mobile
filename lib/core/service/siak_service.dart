import 'dart:convert';

import 'package:siak_app/core/data/base_api.dart';
import 'package:siak_app/core/model/api/api_response.dart';
import 'package:siak_app/core/model/api/api_result_model.dart';
import 'package:siak_app/core/model/krs/krs_model.dart';
import 'package:siak_app/core/model/login/login_model.dart';
import 'package:siak_app/core/model/mahasiswa/mahasiswa_model.dart';
import 'package:siak_app/core/model/news/DpaNewsModel.dart';

import '../data/api.dart';
import '../model/news/NewsModel.dart';

class SIAKService {
  BaseAPI api;
  SIAKService(this.api);

  Future<ApiResult<MahasiswaModel>> postLogin(LoginModel data) async {
    APIResponse response = await api.post(
      api.endPoint.login,
      data: data.toJson(),
      useFormData: true,
      useToken: true,
      token: Api.token,
    );
    print(response.data);
    print(response.statusCode);
    return ApiResult<MahasiswaModel>.fromJson(
        response.data, (data) => MahasiswaModel.fromJson(data));
  }

  Future<ApiResult<KrsModel>> getKrs(String id) async {
    APIResponse response = await api.get(
      api.endPoint.krsMahasiswa.replaceAll(":id", id),
      useToken: true,
      token: Api.token,
    );

    return ApiResult<KrsModel>.fromJson(response.data, (data) => KrsModel.fromJson(data));
  }

  Future<ApiResult<NewsModel>> getNews() async {
    APIResponse response = await api.get(
      api.endPoint.news,
      useToken: false,
    );

    print(response.data);

    return ApiResult<NewsModel>.fromJson(response.data, (data) => NewsModel.fromJson(data));
  }

  Future<ApiResult<DpaNewsModel>> getDpaNews() async {
    APIResponse response = await api.get(
      api.endPoint.infoDpa,
      useToken: false,
    );

    return ApiResult<DpaNewsModel>.fromJson(response.data, (data) => DpaNewsModel.fromJson(data));
  }

}
