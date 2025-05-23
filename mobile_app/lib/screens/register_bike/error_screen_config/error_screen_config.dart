import 'package:flutter/material.dart';

enum ErrorScreenConfig {
  generalError;

  String errorTitle(BuildContext context) => switch (this) {
    generalError => '',
  };
}
