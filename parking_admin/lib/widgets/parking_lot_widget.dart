import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class ParkingLotWidget extends StatelessWidget {
  const ParkingLotWidget({super.key, required this.item, required this.number});

  final ParkingLot item;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        title: Text(
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold),
            'PARKING LOT $number:'),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item.address.toString()),
              Text('Price per hour: ${item.hourlyPrice}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Edit'),
                    onPressed: () => context.go('/parkinglot/edit/${item.id}'),
                  ),
                ],
              )
            ]),

        // tileColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}