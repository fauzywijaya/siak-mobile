import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/constant/themes.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/ui/router/router_generator.dart';
import 'package:siak_app/utils/navigation_utils.dart';

import 'global_providers.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Setup injector
  await setupLocator();

  /// Registering global providers
  var providers = await GlobalProviders.register();

  /// Initialize screenutil
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp(
    providers: providers,
  ));
}

class MyApp extends StatefulWidget {
  final List<dynamic> providers;
  const MyApp({
    Key? key,
    required this.providers,
  }) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void precacheAssets() async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final rawAssets = json.decode(manifestJson) as Map<String, dynamic>;
    final images = rawAssets.keys.where((String key) => key.startsWith('assets/images')).toList();
    final icons = rawAssets.keys.where((String key) => key.startsWith('assets/icons')).toList();
    List<String> assets = [];
    assets.addAll(images);
    assets.addAll(icons);

    for (var asset in assets) {
      try {
        if (asset.contains(".png")) {
          // ignore: use_build_context_synchronously
          precacheImage(AssetImage(asset), context);
        } else if (asset.contains(".svg") && asset != "assets/icons/icon_card.svg") {
          precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset), null);
        }
      } catch (e) {
        debugPrint("ERROR: $e");
        continue;
      }
    }
  }

  @override
  void didChangeDependencies() {
    precacheAssets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: widget.providers as List<SingleChildWidget>,
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: locator<NavigationUtils>().navigatorKey,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        builder: (context, child) {
          (context);
          setupScreenUtil(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            ),
          );
        },
        initialRoute: routeSplash,
        onGenerateRoute: RouterGenerator.generate,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
