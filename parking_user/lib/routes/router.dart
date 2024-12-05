import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_user/layout/parking_layout.dart';
import 'package:parking_user/pages/edit_parking.dart';
import 'package:parking_user/pages/edit_vehicle.dart';
import 'package:parking_user/pages/home_page.dart';
import 'package:parking_user/pages/new_parking_page.dart';
import 'package:parking_user/routes/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  // initialLocation: '/',
  redirect: (BuildContext context, GoRouterState state) {
    return null;

    // final isAuthenticated = // your logic to check if user is authenticated
    // if (!isAuthenticated) {
    //   return '/login';
    // } else {
    //   return null; // return "null" to display the intended route without redirecting
    //  }
  },
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homeRoute.path,
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ParkingLayout(
              navigationShell: navigationShell,
            ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.homeRoute.path,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.newRoute.path,
                builder: (context, state) => const NewParkingPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.vehicleRoute.path,
                builder: (context, state) => const EditVehiclePage(),
                // routes: [
                //   GoRoute(
                //       name: Routes.detailsRoute.name,
                //       path: Routes.detailsRoute.path,
                //       builder: (context, state) =>
                //           const EditParkingPage(data: '')),
                // ],
                routes: <RouteBase>[
                  // Add child routes
                  GoRoute(
                    path: Routes.detailsRoute
                        .path, // NOTE: Don't need to specify "/" character for router’s parents
                    builder: (context, state) {
                      return const EditParkingPage(data: '');
                    },
                  ),
                ],
              ),
            ],
          ),
        ])
    // GoRoute(
    //   name:
    //       'home', // Optional, add name to your routes. Allows you navigate by name instead of path
    //   path: homeRoute,
    //   builder: (context, state) => HomeScreen(),
    // ),
    // GoRoute(
    //   name: 'new parking',
    //   path: newRoute,
    //   builder: (context, state) => ShopeScreen(),
    // ),
    // GoRoute(
    //   name: 'settings',
    //   path: settingsRoute,
    //   builder: (context, state) => ShopeScreen(),
    // ),
    // GoRoute(
    //   path: '/fruits/:id',
    //   builder: (context, state) {
    //     final id = state.pathParameters["id"]; // Get "id" param from URL
    //     return FruitsPage(id: id);
    //   },
    // ),
  ],
);

// class ParkingRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case homeRoute:
//         return MaterialPageRoute(
//             builder: (_) => const HomePage(title: 'Router title'));
//       case newRoute:
//         return MaterialPageRoute(builder: (_) => const NewParkingPage());
//       case detailsRoute:
//         var data = settings.arguments as String;
//         return MaterialPageRoute(builder: (_) => EditParkingPage(data: data));
//       case vehicleRoute:
//         return MaterialPageRoute(builder: (_) => const EditVehiclePage());
//       case settingsRoute:
//         return MaterialPageRoute(builder: (_) => const SettingsPage());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
// }
