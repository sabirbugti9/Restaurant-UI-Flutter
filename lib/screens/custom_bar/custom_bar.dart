import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:restaurant_app_ui/helper/app_colors.dart';
import 'package:restaurant_app_ui/screens/home_page/home_page.dart';

class CustomBar extends StatefulWidget {
  const CustomBar({Key? key}) : super(key: key);

  @override
  State<CustomBar> createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _navScreens() {
    return const [
      HomePage(),
      Center(),
      Center(),
      Center(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: kGreyColor,
        activeColorPrimary: kPrimaryColor,
        icon: const Icon(Icons.home_outlined),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: kGreyColor,
        activeColorPrimary: kPrimaryColor,
        icon: const Icon(Icons.near_me_outlined),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: kGreyColor,
        activeColorPrimary: kPrimaryColor,
        icon: const Icon(Icons.favorite_border),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: kGreyColor,
        activeColorPrimary: kPrimaryColor,
        icon: const Icon(Icons.person_outline),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _navScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style13,
    );
  }
}
