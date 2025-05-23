import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/register_bike/cubit/bike_registration_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Step1RfidActivation extends StatelessWidget {
  const Step1RfidActivation({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text(
          context.translate.activateNfcMessage,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 100),
        SvgPicture.asset(
          'assets/Untitled.svg',
          width: 256,
          height: 256,
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () =>
              context.read<BikeRegistrationCubit>().startScanning(),
          child: Text(context.translate.continueProcess),
        ),
      ],
    );
  }
}
