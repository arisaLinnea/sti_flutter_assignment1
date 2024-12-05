class RouteInfo {
  final String name;
  final String path;

  const RouteInfo({required this.name, required this.path});
}

class Routes {
  Routes._();

  static const RouteInfo homeRoute = RouteInfo(name: 'home', path: '/');
  static const RouteInfo newRoute =
      RouteInfo(name: 'newParking', path: '/newParking');
  static const RouteInfo detailsRoute =
      RouteInfo(name: 'changeParking', path: '/changeParking');
  static const RouteInfo vehicleRoute =
      RouteInfo(name: 'vehicles', path: '/vehicles');
  static const RouteInfo settingsRoute =
      RouteInfo(name: 'settings', path: '/settings');
}
