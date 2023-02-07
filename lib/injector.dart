import 'package:get_it/get_it.dart';
import 'package:siak_app/core/data/api.dart';
import 'package:siak_app/core/data/base_api.dart';
import 'package:siak_app/core/service/siak_service.dart';
import 'package:siak_app/utils/navigation_utils.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// Registering api
  if (locator.isRegistered(instance: Api()) == false) {
    locator.registerSingleton(Api());
  }
  if (locator.isRegistered(instance: BaseAPI()) == false) {
    locator.registerSingleton(BaseAPI());
  }

  /// Registering utils
  locator.registerSingleton(NavigationUtils());

  /// Registering services
  locator.registerLazySingleton(() => SIAKService(locator<BaseAPI>()));
}
