import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/model/bike_with_device.dart';
import 'package:mobile_app/screens/bluetooth_cubit/bluetooth_cubit.dart';

class BikeInfoCard extends StatelessWidget {
  final BikeWitDevice device;

  const BikeInfoCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.pedal_bike),
            ),
            Text(device.bike.bikeName, style: context.textTheme.bodyMedium),
          ],
        ),
        FilledButton.tonal(
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
    );
  }
}
