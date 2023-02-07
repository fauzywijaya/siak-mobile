
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siak_app/core/data/api.dart';
class ConnectionProvider extends ChangeNotifier {
  ///=========================
  /// Property Sections
  ///=========================

  /// Connectivity status
  bool? _internetConnected = true;
  bool? get internetConnected => _internetConnected;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  //
  // void setLoading(bool value) {
  //   _isLoading = value;
  //   notifyListeners();
  // }
  /// Property to check mounted before notify
  bool isDisposed = false;


  FetchResultState _fetchResultState = FetchResultState.Loading;
  FetchResultState get fetchResultState => _fetchResultState;

  /// Dependency injection

  ///=========================
  /// Function Logic Sections
  ///=========================

  /// Instance provider
  static ConnectionProvider instance(BuildContext context)
  => Provider.of(context, listen: false);


  Future<void> connectionSet(bool value) async {
    try {
      _fetchResultState = FetchResultState.Loading;
      final result = value;

      if (result == false) {
        _fetchResultState = FetchResultState.Failure;
        notifyListeners();
        return;
      } else {
        _internetConnected = result;
        _fetchResultState = FetchResultState.HasData;
        notifyListeners();
        return;
      }
    } catch (e) {
      return;
    }
  }

  void setConnection(bool value) {
    if (_internetConnected != value) {
      _internetConnected = value;
      notifyListeners();
    }
  }
  void setLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }


  @override
  void notifyListeners() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}