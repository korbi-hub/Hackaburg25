import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';
import 'package:mobile_app/screens/register_bike/cubit/bike_registration_cubit.dart';
import 'package:mobile_app/screens/register_bike/steps/step_1_nfc_activation.dart';
import 'package:mobile_app/screens/register_bike/steps/step_2_establish_connection.dart';
import 'package:mobile_app/screens/register_bike/steps/step_2a_connection_success.dart';
import 'package:mobile_app/screens/register_bike/steps/step_2b_connection_error.dart';

class RegisterBikeFlow extends StatelessWidget {
  const RegisterBikeFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              BikeRegistrationCubit(context.read<BluetoothConnectionRepo>())
                ..init(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text(context.translate.activateNcf),
            backgroundColor: Colors.grey.shade300,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    BlocBuilder<BikeRegistrationCubit, BikeRegistrationState>(
                      builder: (context, state) {
                        return switch (state) {
                          RfidActivation() => Step1RfidActivation(),
                          EstablishConnection() => Step2EstablishConnection(),
                          ConnectionSuccess() => Step2aConnectionSuccess(),
                          ConnectionError() => Step2bConnectionError(
                            config: state.config,
                          ),
                          // TODO: Handle this case.
                          ScanningDevices() => throw UnimplementedError(),
                        };
                      },
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
