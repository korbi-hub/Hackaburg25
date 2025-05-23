import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/register_bike/cubit/bike_registration_cubit.dart';

class Step1RfidActivation extends StatelessWidget {
  const Step1RfidActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
        //Text(context.translate.activateNcf),
        //Spacer(),
        Text(
        context.translate.activateNfcMessage,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    //Spacer(),
    ElevatedButton(
    onPressed:
    () => context.read<BikeRegistrationCubit>().startScanning(),
    child: Text(context.translate.continueProcess),
    ),
    ],
    ),
    );

    }
}
