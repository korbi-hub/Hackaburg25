import 'package:flutter/material.dart';
import 'package:mobile_app/screens/register_bike/error_screen_config/error_screen_config.dart';

class Step2bConnectionError extends StatelessWidget {
  final ErrorScreenConfig config;

  const Step2bConnectionError({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Text(config.errorTitle(context));
  }
}
