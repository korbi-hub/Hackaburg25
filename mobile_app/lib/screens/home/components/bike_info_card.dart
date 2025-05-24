import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/model/bike_with_device.dart';
import 'package:mobile_app/screens/bluetooth_cubit/bluetooth_cubit.dart';

class BikeInfoCard extends StatelessWidget {
  final BikeWitDevice device;

  const BikeInfoCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300,
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.pedal_bike),
                SizedBox(width: 30),
                Text(
                  device.bike.bikeName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (device.device != null) {
                      context.read<BluetoothCubit>().debugSend(device.device!);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text('Unlock  '), Icon(Icons.bluetooth)],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
