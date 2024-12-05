import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_admin/routes/navigation.dart';
import 'package:parking_admin/screens/home_view.dart';
import 'package:parking_admin/screens/not_exist_view.dart';
import 'package:parking_admin/screens/parking_lot_view.dart';
import 'package:parking_admin/screens/parking_view.dart';

class ParkingAdminLayout extends StatelessWidget {
  ParkingAdminLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  late Widget view = const HomeView();
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  void updateView() {
    switch (navigationShell.currentIndex) {
      case 0:
        view = const HomeView();
        break;
      case 1:
        view = const ParkingLotView();
        break;
      case 2:
        view = const ParkingView();
        break;
      default:
        view = const PageDoesNotExistView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (int index) {
                navigationShell.goBranch(index);
                updateView();
              },
              labelType: labelType,
              destinations: destinations),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(child: navigationShell)
        ],
      ),
    );
  }
}

// ShellRoute(
//  builder: (_, GoRouterState state, child) {
//    return Scaffold(
//   body: Column(children:[Row(
//     children: <Widget>[
//       NavigationRail(....)]),
//   child,]));
// });