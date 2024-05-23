import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_icons.dart';
import 'package:cash_flow_app/screens/activities_screen.dart';
import 'package:cash_flow_app/screens/balance_screen.dart';
import 'package:cash_flow_app/screens/news_screen.dart';
import 'package:cash_flow_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: IndexedStack(
        index: _currentIndex,
        children: [
          const BalanceWidget(),
          const ActivitiesWidget(),
          const NewsWidget(),
          const SettingsWidget()
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14,
        backgroundColor: Color.fromARGB(255, 44, 44, 44),
        selectedItemColor: primary,
        unselectedItemColor: Color(0xffFAFAFA).withOpacity(0.4),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(walletPassive),
            activeIcon: SvgPicture.asset(walletActive),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(activitiesPassive),
            activeIcon: SvgPicture.asset(activitiesActive),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(newsPassive),
            activeIcon: SvgPicture.asset(newsActive),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(settingsPassive),
            activeIcon: SvgPicture.asset(settingsActive),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
