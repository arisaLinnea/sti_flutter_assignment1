import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditVehiclePage extends StatelessWidget {
  const EditVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Vehicle')),
      body: Column(
        children: [
          const Center(child: Text('edit vehicle')),
          TextButton(
            onPressed: () => context.go('/vehicles/changeParking'),
            // context.go(Uri(
            //   path: Routes.detailsRoute.path,
            // ).toString()), //context.goNamed(Routes.detailsRoute.name),
            child: const Text('Go to change parking'),
          )
        ],
      ),
    );
  }
}
