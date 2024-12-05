import 'package:flutter/material.dart';
import 'package:parking_admin/widgets/parking_lot_widget.dart';
import 'package:shared/shared.dart';
import 'package:shared_client/shared_client.dart';

class ParkingLotView extends StatefulWidget {
  const ParkingLotView({super.key});

  @override
  State<ParkingLotView> createState() => _ParkingLotViewState();

  // @override
  // Widget build(BuildContext context) {
  //   return const Center(child: Text("TODO"));
  // }
}

class _ParkingLotViewState extends State<ParkingLotView> {
  Future<List<ParkingLot>> getList = ParkingLotRepository().getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("Available parking lots"),
        ),
        body: FutureBuilder<List<ParkingLot>>(
          future: getList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ParkingLotWidget(
                        item: snapshot.data![index], number: index + 1);
                  });
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ));
  }
}
