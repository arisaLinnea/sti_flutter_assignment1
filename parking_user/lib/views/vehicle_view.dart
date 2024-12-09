import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_user/providers/auth_state.dart';
import 'package:parking_user/providers/vehicle_provider.dart';
import 'package:parking_user/widgets/vehicle_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';

class VehicleView extends StatefulWidget {
  const VehicleView({super.key});

  @override
  State<VehicleView> createState() => _VehicleViewState();
}

class _VehicleViewState extends State<VehicleView> {
  @override
  void initState() {
    super.initState();
    Owner? owner = Provider.of<AuthState>(context, listen: false).userInfo;
    context.read<VehicleListProvider>().setOwner(owner);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My vehicles')),
      body: Consumer<VehicleListProvider>(builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.vehicles.isEmpty) {
          return const Text('No vehicles available.');
        }
        return ListView.builder(
          itemCount: provider.vehicles.length,
          itemBuilder: (context, index) {
            return VehicleWidget(
                item: provider.vehicles[index], number: index + 1);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new vehicle',
        onPressed: () {
          context.go('/vehicles/addVehicle');
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
