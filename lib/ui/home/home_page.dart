import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ornek_proje/core/base/view/base_view.dart';
import 'package:ornek_proje/ui/home/home_view_model.dart';
import 'package:ornek_proje/ui/home/navigation_bar/profile/profile_page.dart';
import 'package:ornek_proje/ui/home/navigation_bar/select/select_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatelessWidget {
  final int page;
  const HomePage({this.page});

  List<Widget> _buildScreens() {
    return [
      const SelectPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(AntDesign.home),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: const Color.fromRGBO(123, 117, 145, 1),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(AntDesign.questioncircleo),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: const Color.fromRGBO(123, 117, 145, 1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(page),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) {
        return Scaffold(
          body: body(viewModel, context),
        );
      },
    );
  }

  PersistentTabView body(HomeViewModel viewModel, BuildContext context) {
    return PersistentTabView(
      context,
      controller: viewModel.controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      stateManagement: true,
      backgroundColor:
          const Color.fromRGBO(30, 26, 43, 1), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
