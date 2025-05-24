import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/register_bike/cubit/bike_registration_cubit.dart';

class Step1RfidActivation extends StatelessWidget {
  const Step1RfidActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Text(context.translate.activateNcf),
        //Spacer(),
        Text(
          context.translate.activateNfcMessage,
          style: context.textTheme.bodyMedium,
        ),
        SizedBox(height: 30),
        SvgPicture.asset('assets/Untitled.svg', width: 256, height: 256),
        SizedBox(height: 50),
        //Spacer(),
        FilledButton.tonal(
          onPressed:
              () => context.read<BikeRegistrationCubit>().startScanning(),
          child: Text(context.translate.continueProcess),
        ),
      ],
    );
  }
}
