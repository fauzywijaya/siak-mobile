import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/model/news/DpaNewsModel.dart';
import 'package:siak_app/core/service/siak_service.dart';
import 'package:siak_app/injector.dart';

class DpaNewsProvider extends ChangeNotifier {
  final SIAKService _siakService = locator<SIAKService>();

  String _message = '';
  String get message => _message;

  DpaNewsModel? _dpaNewsModel;
  DpaNewsModel? get dpaNewsModel => _dpaNewsModel;


  FetchResultState? _fetchResultState;
  FetchResultState? get fetchResultState => _fetchResultState;

  void setFetchDpanNews(FetchResultState newState) {
    _fetchResultState = newState;
    notifyListeners();
  }

  Future<dynamic> fetchDpaNews() async {
    try {
      _fetchResultState = FetchResultState.Loading;
      final result = await _siakService.getDpaNews();

      if (result.data.data == null) {
        _fetchResultState = FetchResultState.Failure;
        notifyListeners();
        return;
      }else if ((result.data.data ?? []).isEmpty) {
        _fetchResultState = FetchResultState.NoData;
        notifyListeners();
        return;
      }else {
        _dpaNewsModel = result.data;
        _fetchResultState = FetchResultState.HasData;
        notifyListeners();
        return true;
      }
    } on TimeoutException catch (e) {
      _fetchResultState = FetchResultState.Failure;
      notifyListeners();
      return _message = 'TIMEOUT: $e';
    } on SocketException catch (e) {
      _fetchResultState = FetchResultState.Failure;
      notifyListeners();
      return _message = 'NO CONNECTION: $e';
    } on Error catch (e) {
      _fetchResultState = FetchResultState.Failure;
      notifyListeners();
      return _message = 'ERROR: $e';
    }
  }

}