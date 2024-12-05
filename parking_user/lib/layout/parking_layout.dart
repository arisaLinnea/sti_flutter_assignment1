import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_user/routes/navigation.dart';

class ParkingLayout extends StatelessWidget {
  const ParkingLayout({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ParkingLayout'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => Scaffold(
        //appBar finns på pages
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: const Text("widget.title"),
        // ),
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          indicatorColor: Theme.of(context).primaryColor,
          destinations: navbar,
        ),
      );
}
