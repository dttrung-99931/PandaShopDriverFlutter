import 'package:flutter/material.dart';
import 'package:panshop_driver/core/constants/constants.dart';
import 'package:panshop_driver/features/account/account_screen.dart';
import 'package:panshop_driver/features/home/home_screen.dart';
import 'package:panshop_driver/features/main/widgets/main_bottom_nav_bar.dart';
import 'package:panshop_driver/global.dart';
import 'package:panshop_driver/shared/widgets/keep_page_alive.dart';

class MainScreen extends StatefulWidget {
  static const route = '/main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    if (Global.selectedMainPageIndexNotifier.value != 0) {
      Global.selectedMainPageIndexNotifier.value = 0;
    }
    Global.selectedMainPageIndexNotifier.addListener(_onMainPageChanged);
    super.initState();
  }

  void _onMainPageChanged() {
    if (_pageController.hasClients && mounted) {
      _pageController.jumpToPage(Global.selectedMainPageIndexNotifier.value);
    }
  }

  @override
  void dispose() {
    Global.selectedMainPageIndexNotifier.removeListener(_onMainPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: 3,
          onPageChanged: (index) {
            Global.selectedMainPageIndexNotifier.value = index;
          },
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const KeepPageAlive(child: HomeScreen());
              case 1:
                return emptyWidget;
              case 2:
                return const KeepPageAlive(child: AccountScreen());
              default:
            }

            throw 'Page number not match';
          },
        ),
        bottomNavigationBar: MainBottomNavBar(
          selectedIndexNotifier: Global.selectedMainPageIndexNotifier,
        ),
      ),
    );
  }
}
