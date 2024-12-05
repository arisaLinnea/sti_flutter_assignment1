import 'package:flutter/material.dart';

class EditParkingPage extends StatelessWidget {
  final String data;
  const EditParkingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: const Center(child: Text('edit parking')),
    );
  }
}
