import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/model/saved_bike.dart';
import 'package:mobile_app/screens/home/cubit/home_cubit.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pedal_bike),
            SizedBox(width: 20,),
            Text(context.translate.bikeNameLabel,
            style: TextStyle(fontSize: 18),),
            SizedBox(width: 20),
          ],
        ),

        SizedBox(height: 20),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                context.read<HomeCubit>().getBikes();
              },
              child: Text(context.translate.addBike),
            ),
          ],
        ),
        SizedBox(height: 150),
      ],
    );
  }
}
