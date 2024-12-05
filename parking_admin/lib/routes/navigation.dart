import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<NavigationRailDestination> destinations =
    <NavigationRailDestination>[
  NavigationRailDestination(
    icon: Icon(Icons.favorite_border),
    selectedIcon: Icon(Icons.favorite),
    label: Text('Home'),
  ),
  NavigationRailDestination(
    icon: Icon(Icons.bookmark_border),
    selectedIcon: Icon(Icons.book),
    label: Text('Parking Lots'),
  ),
  NavigationRailDestination(
    icon: FaIcon(FontAwesomeIcons.car),
    selectedIcon: Icon(Icons.book),
    label: Text('Parkings'),
  ),
];
