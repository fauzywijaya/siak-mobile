import 'package:provider/provider.dart';
import 'package:siak_app/core/viewmodels/login/login_provider.dart';
import 'package:siak_app/core/viewmodels/news/dpa_news_provider.dart';
import 'package:siak_app/core/viewmodels/news/news_provider.dart';

import 'core/viewmodels/connection/connection_provider.dart';
import 'core/viewmodels/krs/krs_provider.dart';

class GlobalProviders {
  /// Register your provider here
  static Future register() async => [
        ChangeNotifierProvider(create: (context) => ConnectionProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => KrsProvider()),
        ChangeNotifierProvider(create: (context) => NewsProvider()),
        ChangeNotifierProvider(create: (context) => DpaNewsProvider()),
      ];
}
