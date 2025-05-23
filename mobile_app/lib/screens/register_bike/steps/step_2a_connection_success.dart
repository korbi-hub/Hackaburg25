import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/model/saved_bike.dart';
import 'package:mobile_app/screens/register_bike/cubit/bike_registration_cubit.dart';

class Step2aConnectionSuccess extends StatelessWidget {
  final BluetoothDevice device;
  final TextEditingController controller;

  Step2aConnectionSuccess({super.key, required this.device})
    : controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(context.translate.bikeNameLabel),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<BikeRegistrationCubit>().finishProcess(
                  Bike(
                    bikeName: controller.value.text,
                    lock: BikeLock(
                      lockUuid: device.remoteId.toString(),
                      bluetoothDeviceId: device.remoteId.toString(),
                    ),
                  ),
                  context,
                );
              },
              child: Text(context.translate.addBike),
            ),
          ],
        ),
      ],
    );
  }
}
