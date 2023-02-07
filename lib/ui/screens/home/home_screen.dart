
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:siak_app/gen/assets.gen.dart';
import 'package:siak_app/ui/constant/constant.dart';
import 'package:siak_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:siak_app/ui/screens/lectures/menulectures/lectures_screen.dart';
import 'package:siak_app/ui/screens/payment/menupayment/payment_screen.dart';
import 'package:siak_app/ui/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens[_currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  List<Widget> _buildScreens = [
    const  DashboardMahasiswaScreen(),
    const  LecturesScreen(),
    const  PaymentScreen(),
    const  ProfileScreen()
  ];

  Widget _bottomNavBar() {
    return CustomNavigationBar(
      iconSize: 25,
      selectedColor: bluePrimary,
      unSelectedColor: grayPrimary,
      strokeColor: bluePrimary,
      backgroundColor: whitePrimary,
      elevation: 10,
      currentIndex: _currentIndex,
      onTap: (index) {
        if (_currentIndex != index) {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      items: _buildItemsBottomNav()
    );
  }

  List<CustomNavigationBarItem> _buildItemsBottomNav() {
    return [
      CustomNavigationBarItem(
        icon: const HeroIcon(HeroIcons.home, style: HeroIconStyle.solid),
        showBadge: false,
        badgeCount: 0
      ),
      CustomNavigationBarItem(
        icon: const HeroIcon(HeroIcons.academicCap, style: HeroIconStyle.solid,),
          showBadge: false,
          badgeCount: 0
      ),
      CustomNavigationBarItem(
        icon:const HeroIcon(
          HeroIcons.creditCard,
            style: HeroIconStyle.solid
        ),

          showBadge: false,
          badgeCount: 0
      ),
      CustomNavigationBarItem(
        icon: const HeroIcon(
          HeroIcons.user,
          style: HeroIconStyle.solid,
        ),
          showBadge: false,
          badgeCount: 0
      ),
    ];

  }
}

