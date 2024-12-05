import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_admin/auth/auth_provider.dart';
import 'package:parking_admin/layout/parking_admin_layout.dart';
import 'package:parking_admin/routes/routes.dart';
import 'package:parking_admin/screens/edit_parking_lot_view.dart';
import 'package:parking_admin/screens/home_view.dart';
import 'package:parking_admin/screens/login_view.dart';
import 'package:parking_admin/screens/not_exist_view.dart';
import 'package:parking_admin/screens/parking_lot_view.dart';
import 'package:parking_admin/screens/parking_view.dart';
import 'package:provider/provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    final authStatus = context.watch<AuthState>().status;
    if (authStatus != AuthStatus.authenticated) {
      return '/login';
    } else {
      return null; // return "null" to display the intended route without redirecting
    }
  },
  errorBuilder: (context, state) => PageDoesNotExistView(error: state.error),
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homeRoute.path,
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ParkingAdminLayout(
              navigationShell: navigationShell,
            ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.homeRoute.path,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.loginRoute.path,
                builder: (context, state) => const LoginView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.parkingLotRoute.path,
                builder: (context, state) => const ParkingLotView(),
                routes: <RouteBase>[
                  // Add child routes
                  GoRoute(
                    path: Routes.editParkingLotRoute
                        .path, // NOTE: Don't need to specify "/" character for router’s parents
                    builder: (context, state) {
                      final id = state.pathParameters["lotId"]!;
                      return EditParkingLotView(lotId: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.parkingRoute.path,
                builder: (context, state) => const ParkingView(),
                routes: const <RouteBase>[
                  // Add child routes
                  // GoRoute(
                  //   path: Routes.detailsRoute
                  //       .path, // NOTE: Don't need to specify "/" character for router’s parents
                  //   builder: (context, state) {
                  //     return const EditParkingPage(data: '');
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ])
  ],
);
