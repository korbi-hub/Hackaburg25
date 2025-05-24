import 'package:flutter/material.dart';
import 'package:mobile_app/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;

  NavigatorState get navigator => Navigator.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}
