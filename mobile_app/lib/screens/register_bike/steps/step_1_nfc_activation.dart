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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                context.translate.activateNcf,
                style: context.textTheme.titleSmall,
              ),
            ),
            Text(
              context.translate.activateNfcMessage,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/Untitled.svg',
          width: MediaQuery.of(context).size.width / 2,
        ),
        Text(
          context.translate.activateNfcMessage2,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        FilledButton.tonal(
          onPressed:
              () => context.read<BikeRegistrationCubit>().startScanning(),
          child: Text(context.translate.continueProcess),
        ),
      ],
    );
  }
}
