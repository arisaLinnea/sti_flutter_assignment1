import 'package:flutter/material.dart';
import 'package:parking_user/providers/vehicle_provider.dart';
import 'package:parking_user/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:shared_client/shared_client.dart';

class VehicleWidget extends StatelessWidget {
  const VehicleWidget({super.key, required this.item, required this.number});

  final Vehicle item;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        title: Text(
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold),
            'Vehicle $number:'),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Registration number: ${item.registrationNo}'),
              Text('Type: ${item.type.name}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Remove'),
                    onPressed: () async {
                      bool success =
                          await VehicleRepository().remove(id: item.id);
                      if (success) {
                        Utils.toastMessage('Vehicle removed');
                      } else {
                        Utils.toastMessage('Failed to remove vehicle');
                      }
                      if (context.mounted) {
                        context.read<VehicleListProvider>().updateVehicleList();
                      }
                    },
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
