import 'package:flutter/material.dart';

final List<Widget> navbar = [
  const NavigationDestination(
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home, color: Colors.white),
      label: 'Home'),
  const NavigationDestination(
      icon: Icon(Icons.car_rental),
      selectedIcon: Icon(Icons.car_rental, color: Colors.white),
      label: 'Vehicle'),
  const NavigationDestination(
      icon: Icon(Icons.person_2),
      selectedIcon: Icon(Icons.person_2, color: Colors.white),
      label: 'Profile')
];
