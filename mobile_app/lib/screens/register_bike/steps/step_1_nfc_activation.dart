import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';

class Step1RfidActivation extends StatelessWidget {
  const Step1RfidActivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(context.translate.activateNcf),
        Spacer(),
        Expanded(child: Text(context.translate.activateNfcMessage)),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: Text(context.translate.continueProcess),
        ),
      ],
    );
  }
}
