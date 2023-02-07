import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:siak_app/core/model/krs/krs_model.dart';

import '../../../injector.dart';
import '../../data/api.dart';
import '../../service/siak_service.dart';

class KrsProvider extends ChangeNotifier {
  final SIAKService _siakService = locator<SIAKService>();

  KrsModel? _krsModel;
  KrsModel? get krsModel => _krsModel;

  String _message = '';
  String get message => _message;

  FetchResultState _fetchResultState = FetchResultState.Loading;
  FetchResultState get fetchResultState => _fetchResultState;

  Future<void> fetchKRS(String id) async {
    try {
      _fetchResultState = FetchResultState.Loading;
      final result = await _siakService.getKrs(id);

      if (result.data.data == null) {
        _fetchResultState = FetchResultState.Failure;
        _message = "Failure";
        notifyListeners();
        return;
      } else if ((result.data.data ?? []).isEmpty) {
        _fetchResultState = FetchResultState.NoData;
        _message = "No Data";
        notifyListeners();
        return;
      } else {
        _krsModel = result.data;
        _fetchResultState = FetchResultState.HasData;
        _message = "Success";
        notifyListeners();
        return;
      }
    } on TimeoutException catch (e) {
      _fetchResultState = FetchResultState.Failure;
      _message = "TIMEOUT : $e";
      notifyListeners();
      return;
    } on SocketException catch (e) {
      _fetchResultState = FetchResultState.Failure;
      _message = 'NO CONNECTION: $e';
      notifyListeners();
      return;
    } on Error catch (e) {
      _fetchResultState = FetchResultState.Failure;
      _message = 'ERROR: $e';
      notifyListeners();
      return;
    }
  }
}
