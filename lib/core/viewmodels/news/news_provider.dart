import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/model/news/NewsModel.dart';
import 'package:siak_app/core/service/siak_service.dart';
import 'package:siak_app/injector.dart';

class NewsProvider extends ChangeNotifier {
  final SIAKService _siakService = locator<SIAKService>();

  String _message = '';
  String get message => _message;

  NewsModel? _newsModel;
  NewsModel? get newsModel => _newsModel;

  FetchResultState? _fetchResultState;
  FetchResultState? get fetchResultState => _fetchResultState;

  void setFetchNews(FetchResultState newState) {
    _fetchResultState = newState;
    notifyListeners();
  }

  Future<dynamic> fetchNewsList() async {
    // try {
    _fetchResultState = FetchResultState.Loading;
    final result = await _siakService.getNews();

    print(result);

    if (result.data.data == null) {
      _fetchResultState = FetchResultState.Failure;
      notifyListeners();
      return _message = "Failure";
    } else if ((result.data.data ?? []).isEmpty) {
      _fetchResultState = FetchResultState.NoData;
      notifyListeners();
      return _message = "No Data";
    } else {
      _newsModel = result.data;
      _fetchResultState = FetchResultState.HasData;
      notifyListeners();
      return _message = "Success";
    }
    // } on TimeoutException catch (e) {
    //   _fetchResultState = FetchResultState.Failure;
    //   notifyListeners();
    //   return _message = "TIMEOUT : $e";
    // } on SocketException catch (e) {
    //   _fetchResultState = FetchResultState.Failure;
    //   notifyListeners();
    //   return _message = 'NO CONNECTION: $e';
    // } on Error catch (e) {
    //   _fetchResultState = FetchResultState.Failure;
    //   notifyListeners();
    //   return _message = 'ERROR: $e';
    // }
  }
}
