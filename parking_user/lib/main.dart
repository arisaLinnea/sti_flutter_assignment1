import 'package:flutter/material.dart';
import 'package:parking_user/routes/router.dart';
import 'package:parking_user/style/theme.dart';

// void main() {
//   runApp(const FindMeASpot());
// }

void main() => runApp(const FindMeASpot());

class FindMeASpot extends StatelessWidget {
  const FindMeASpot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Find Me A Spot',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system);
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
