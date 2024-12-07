import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_admin/providers/auth_provider.dart';
import 'package:parking_admin/providers/theme_provider.dart';
import 'package:parking_admin/routes/navigation.dart';
import 'package:parking_admin/screens/home_view.dart';
import 'package:parking_admin/screens/not_exist_view.dart';
import 'package:parking_admin/screens/parking_lot_view.dart';
import 'package:parking_admin/screens/parking_view.dart';
import 'package:provider/provider.dart';

class ParkingAdminLayout extends StatelessWidget {
  ParkingAdminLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  late Widget view = const HomeView();
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (int index) {
              navigationShell.goBranch(index);
              // updateView();
            },
            labelType: labelType,
            destinations: destinations,
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(children: [
                    IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () => context.read<AuthState>().logout(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.brightness_6),
                      onPressed: () {
                        ThemeNotifier themeNotifier =
                            Provider.of<ThemeNotifier>(context, listen: false);
                        if (themeNotifier.themeMode == ThemeMode.light) {
                          themeNotifier.setTheme(ThemeMode.dark);
                        } else {
                          themeNotifier.setTheme(ThemeMode.light);
                        }
                      },
                    ),
                  ]),
                ),
              ),
            ),
          ),
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