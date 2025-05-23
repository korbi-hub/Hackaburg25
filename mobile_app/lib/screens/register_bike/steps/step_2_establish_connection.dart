import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/screens/bluetooth_cubit/bluetooth_cubit.dart';

class Step2EstablishConnection extends StatelessWidget {
  const Step2EstablishConnection({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onTap:
                              () => context.read<BluetoothCubit>().debugSend(
                                device,
                              ),
                        ),
                      )
                      .toList(),
            ),
          );
        }
        return ElevatedButton(
          onPressed: () => context.read<BluetoothCubit>().scan(),
          child: Text('retry'),
        );
      },
    );
  }
}
