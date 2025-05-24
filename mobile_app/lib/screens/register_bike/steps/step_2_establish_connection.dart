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
              children: [
                for (final device in state.devices) ...[
                  InkWell(
                    onTap:
                        () => context
                            .read<BikeRegistrationCubit>()
                            .goToRegistration(device),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 48.0),
                            child: Icon(Icons.bluetooth),
                          ),
                          Text(
                            device.platformName,
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (device != state.devices.last)
                    Divider(color: Colors.grey.withOpacity(0.05)),
                ],
              ],
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
                FilledButton.tonal(
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
