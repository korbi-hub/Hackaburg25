import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/model/bike_with_device.dart';
import 'package:mobile_app/screens/bluetooth_cubit/bluetooth_cubit.dart';
import 'package:mobile_app/screens/home/components/bike_info_card.dart';
import 'package:mobile_app/screens/home/cubit/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final count = 10;

  @override
  Widget build(BuildContext context) {
    context.read<BluetoothCubit>().init();
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var data = <BikeWitDevice>[];
          if (state is BikeDataState) {
            data = state.bikesWithDevice;
          }
          return Column(
            children: [
              for (final device in data) ...[BikeInfoCard(device: device)],
            ],
          );
        },
      ),
    );
  }
}
