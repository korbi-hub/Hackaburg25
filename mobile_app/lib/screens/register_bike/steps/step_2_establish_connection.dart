import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/bluetooth_cubit/bluetooth_cubit.dart';
import 'package:mobile_app/screens/register_bike/cubit/bike_registration_cubit.dart';

class Step2EstablishConnection extends StatelessWidget {
  const Step2EstablishConnection({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BluetoothCubit>().scan();
    return BlocBuilder<BluetoothCubit, BluetoothCubitState>(
      builder: (ctx, state) {
        if (state is BluetoothDeviceList) {
          return SingleChildScrollView(
            child: Column(
              spacing: 12,
              children:
                  state.devices
                      .map(
                        (device) => InkWell(
                          child: ListTile(title: Text('$device')),
                          onTap: () {
                            // context.read<BluetoothCubit>().debugSend(device);
                            context
                                .read<BikeRegistrationCubit>()
                                .goToRegistration(device);
                          },
                        ),
                      )
                      .toList(),
            ),
          );
        } else if (state is BluetoothLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<BluetoothCubit>().scan(),
                  child: Text(context.translate.retryScan),
                ),
                SizedBox(height: 140),
              ],
            ),
          ],
        );
      },
    );
  }
}
