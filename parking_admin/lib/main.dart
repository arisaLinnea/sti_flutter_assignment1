import 'package:flutter/material.dart';
import 'package:parking_admin/auth/auth_provider.dart';
import 'package:parking_admin/screens/login_view.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_admin/routes/router.dart';
import 'package:parking_admin/screens/home_view.dart';
import 'package:parking_admin/screens/not_exist_view.dart';
import 'package:parking_admin/screens/parking_lot_view.dart';
import 'package:parking_admin/screens/parking_view.dart';
import 'package:parking_admin/style/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthState(),
      child: const FindMeASpotAdmin(),
    ),
  );
}

class FindMeASpotAdmin extends StatelessWidget {
  const FindMeASpotAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final authStatus = context.watch<AuthState>().status;
    return MaterialApp(
        debugShowCheckedModeBanner: false, //removes the debug banner in the app
        title: 'Find Me A Spot Admin',
        // theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          // primarySwatch: Colors.green,
          // scaffoldBackgroundColor: Colors.black,
          // navigationRailTheme:
          //     const NavigationRailThemeData(backgroundColor: Colors.green),
          colorSchemeSeed: Colors.indigo,
          appBarTheme: const AppBarTheme(color: Colors.blue),
          // primaryColor: Colors.blue,
          hintColor: Colors.blueAccent,
          // textTheme: TextTheme()
        ),
        home: const NavRailView()
        // home: authStatus == AuthStatus.authenticated
        //     ? const NavRailView()
        //     : const LoginView(),
        );
  }
}

class AuthViewSwitcher extends StatelessWidget {
  const AuthViewSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final authStatus = context.watch<AuthState>().status;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeOutCubic,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: authStatus == AuthStatus.authenticated
            ? const NavRailView()
            : const LoginView(),
      ),
    );
  }
}

class NavRailView extends StatefulWidget {
  const NavRailView({super.key});

  @override
  State<NavRailView> createState() => _NavRailViewState();
}

class _NavRailViewState extends State<NavRailView> {
  final int _selectedIndex = 0;

  // late Widget view = const HomeScreen();

  // NavigationRailLabelType labelType = NavigationRailLabelType.all;

  // var destinations = const <NavigationRailDestination>[
  //   NavigationRailDestination(
  //     icon: Icon(Icons.favorite_border),
  //     selectedIcon: Icon(Icons.favorite),
  //     label: Text('Home'),
  //   ),
  //   NavigationRailDestination(
  //     icon: Icon(Icons.bookmark_border),
  //     selectedIcon: Icon(Icons.book),
  //     label: Text('Parking Lots'),
  //   ),
  //   NavigationRailDestination(
  //     icon: FaIcon(FontAwesomeIcons.car),
  //     selectedIcon: Icon(Icons.book),
  //     label: Text('Parkings'),
  //   ),
  // ];

  // void updateView() {
  //   switch (_selectedIndex) {
  //     case 0:
  //       view = const HomeScreen();
  //       break;
  //     case 1:
  //       view = const ParkingLotView();
  //       break;
  //     case 2:
  //       view = const ParkingView();
  //       break;
  //     default:
  //       view = const PageDoesNotExistView();
  //   }
  // }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Find Me A Spot Admin',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system);
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Row(
  //       children: <Widget>[
  //         NavigationRail(
  //             selectedIndex: _selectedIndex,
  //             onDestinationSelected: (int index) {
  //               setState(() {
  //                 _selectedIndex = index;
  //                 updateView();
  //               });
  //             },
  //             labelType: labelType,
  //             destinations: destinations),
  //         const VerticalDivider(thickness: 1, width: 1),
  //         // This is the main content.
  //         Expanded(child: view)
  //       ],
  //     ),
  //   );
  // }
}
