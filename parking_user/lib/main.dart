import 'package:flutter/material.dart';
import 'package:parking_user/providers/auth_state.dart';
import 'package:parking_user/providers/theme_provider.dart';
import 'package:parking_user/routes/router.dart';
import 'package:parking_user/style/theme.dart';
import 'package:parking_user/views/login_view.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const FindMeASpot());
// }

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthState()),
      ChangeNotifierProvider(create: (_) => ThemeNotifier())
    ],
    child: const FindMeASpot(),
  ));
}

class FindMeASpot extends StatelessWidget {
  const FindMeASpot({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Find Me A Spot Admin',
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorSchemeSeed: Colors.indigo,
      //   appBarTheme: const AppBarTheme(color: Colors.blue),
      //   hintColor: Colors.blueAccent,
      // ),
      home: AuthViewSwitcher(),
    );
  }
}

class AuthViewSwitcher extends StatelessWidget {
  const AuthViewSwitcher({super.key});
  // This widget is the root of your application.
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
            ? const UserView()
            : const LoginView(),
      ),
    );
  }
  // => MaterialApp.router(
  // routerConfig: router,
  // debugShowCheckedModeBanner: false,
  // title: 'Find Me A Spot',
  // theme: lightTheme,
  // darkTheme: darkTheme,
  // themeMode: ThemeMode.system);

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Find Me A Spot',
  //     theme: lightTheme,
  //     darkTheme: darkTheme,
  //     themeMode: ThemeMode.system,
  //     // theme: ThemeData(
  //     //   colorScheme: colorScheme,
  //     //   useMaterial3: true,
  //     // ),
  //     debugShowCheckedModeBanner: false,
  //     home: const HomePage(title: 'Flutter Demo Home Page'),
  //     onGenerateRoute: ParkingRouter.generateRoute,
  //     initialRoute: homeRoute,
  //   );
  // }
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  // final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          title: 'Find Me A Spot',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeNotifier.themeMode,
        );
      },
    );
    // routerConfig: router,
    // debugShowCheckedModeBanner: false,
    // title: 'Find Me A Spot',
    // theme: lightTheme,
    // darkTheme: darkTheme,
    // themeMode: ThemeMode.system);

    // Widget build(BuildContext context) => MaterialApp.router(
    //     routerConfig: router,
    //     debugShowCheckedModeBanner: false,
    //     title: 'Find Me A Spot Admin',
    //     theme: lightTheme,
    //     darkTheme: darkTheme,
    //     themeMode: ThemeMode.system);
  }
}
