import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/model/login/login_model.dart';
import 'package:siak_app/core/model/mahasiswa/mahasiswa_model.dart';
import 'package:siak_app/core/service/siak_service.dart';
import 'package:siak_app/injector.dart';

class LoginProvider extends ChangeNotifier {
  final SIAKService _siakService = locator<SIAKService>();

  MahasiswaDataModel? _mahasiswaData;
  MahasiswaDataModel? get mahasiswaData => _mahasiswaData;

  String _message = '';
  String get message => _message;

  PostResultState? _postState = PostResultState.Idle;
  PostResultState? get postState => _postState;

  void setPostState(PostResultState newState) {
    _postState = newState;
    notifyListeners();
  }

  Future<MahasiswaDataModel?> postLogin({
    required int identitas,
    required String password,
  }) async {
    _postState = PostResultState.Loading;
    notifyListeners();
    try {
      LoginModel loginModel = LoginModel(identitas: identitas, password: password);
      final resultLogin = await _siakService.postLogin(loginModel);
      if (resultLogin.data.data == null) {
        _postState = PostResultState.Failure;
        _message = "Periksa kembali NIM / Password Anda";
        notifyListeners();
        return null;
      }
      _postState = PostResultState.Success;
      _mahasiswaData = resultLogin.data.data;
      _message = "Selamat datang ${_mahasiswaData?.attributes?.nama ?? ""}";
      notifyListeners();
      return resultLogin.data.data;
    } on TimeoutException catch (e) {
      _postState = PostResultState.Failure;
      _message = 'TIMEOUT: $e';
      print(_message);
      notifyListeners();
      return null;
    } on SocketException catch (e) {
      _postState = PostResultState.Failure;
      _message = 'NO CONNECTION: $e';
      print(_message);
      notifyListeners();
      return null;
    } on Error catch (e) {
      _postState = PostResultState.Failure;
      _message = 'ERROR: $e';
      print(_message);
      notifyListeners();
      return null;
    }
  }
}
