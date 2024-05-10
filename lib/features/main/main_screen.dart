import 'package:flutter/material.dart';
import 'package:panshop_driver/core/constants/constants.dart';
import 'package:panshop_driver/features/home/home_screen.dart';
import 'package:panshop_driver/features/main/widgets/main_bottom_nav_bar.dart';
import 'package:panshop_driver/global.dart';

class MainScreen extends StatefulWidget {
  static const route = '/main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<int> get _currentPageIndex => Global.selectedHomePageIndexNotifier;

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    _currentPageIndex.addListener(() {
      if (_pageController.hasClients && mounted) {
        _pageController.jumpToPage(_currentPageIndex.value);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          onPageChanged: (index) {
            _currentPageIndex.value = index;
          },
          controller: _pageController,
          itemCount: 4,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const HomeScreen();
              case 1:
                return emptyWidget;
              case 2:
                return emptyWidget;
              case 3:
                return emptyWidget;
              default:
            }

            throw 'Page number not match';
          },
        ),
        bottomNavigationBar: MainBottomNavBar(
          selectedIndexNotifier: Global.selectedHomePageIndexNotifier,
        ),
      ),
    );
  }
}
