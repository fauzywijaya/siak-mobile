import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:siak_app/ui/router/route_list.dart';
import 'package:siak_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:siak_app/ui/screens/dashboard/dashboardtab/webview_screen.dart';
import 'package:siak_app/ui/screens/home/home_screen.dart';
import 'package:siak_app/ui/screens/lectures/ipk/ipk_screen.dart';
import 'package:siak_app/ui/screens/lectures/krs/krs_screen.dart';
import 'package:siak_app/ui/screens/lectures/menulectures/lectures_screen.dart';
import 'package:siak_app/ui/screens/onboard/onboarding_screen.dart';
import 'package:siak_app/ui/screens/payment/menupayment/payment_screen.dart';
import 'package:siak_app/ui/screens/payment/paymentrecap/payment_recap_screen.dart';
import 'package:siak_app/ui/screens/payment/virtualaccount/virtual_account_screen.dart';
import 'package:siak_app/ui/screens/profile/profile_screen.dart';
import 'package:siak_app/ui/screens/signin/signin_screen.dart';
import 'package:siak_app/ui/screens/splash/splash_screen.dart';

class RouterGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      /// Splash group
      case routeSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: const RouteSettings(name: routeSplash),
        );

      case routeOnboarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
          settings: const RouteSettings(name: routeOnboarding),
        );

      case routeHome:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),
            settings: const RouteSettings(name: routeHome)
        );
      case routeLogin:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
          settings: const RouteSettings(name: routeLogin),
        );

      case routeDashboardMahasiswa:
        return MaterialPageRoute(
          builder: (_) => const DashboardMahasiswaScreen(),
          settings: const RouteSettings(name: routeDashboardMahasiswa),
        );

      case routeLectures:
        return MaterialPageRoute(
          builder: (_) => const LecturesScreen(),
          settings: const RouteSettings(name: routeLectures),
        );
      case routeLecturesIpk:
        return MaterialPageRoute(
          builder: (_) => const IpkScreen(),
          settings: const RouteSettings(name: routeLecturesIpk)
        );
      case routeLecturesKrs:
        return MaterialPageRoute(
            builder: (_) => const KrsScreen(),
            settings: const RouteSettings(name: routeLecturesKrs)
      );
      case routePayment:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
          settings: const RouteSettings(name: routePayment),
      );

      case routePaymentVirtualAccount:
        return MaterialPageRoute(
          builder: (_) => const VirtualAccountScreen(),
          settings: const RouteSettings(name: routePaymentVirtualAccount),
        );

      case routePaymentRekap:
        return MaterialPageRoute(
          builder: (_) => const PaymentRecapScreen(),
          settings: const RouteSettings(name: routePaymentRekap),
        );
      case routeProfileMahasiswa:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: const RouteSettings(name: routeProfileMahasiswa),
        );
      case routeWebView:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => WebViewScreen(urlDestination: args),
            settings: const RouteSettings(name: routeWebView),
          );
        }
    }

    return null;
  }
}
