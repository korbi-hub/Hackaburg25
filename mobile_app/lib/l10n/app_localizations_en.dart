// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Homescreen';

  @override
  String get appName => 'ShareLock';

  @override
  String get registerBike => 'Register bike';

  @override
  String get registerYourBike => 'Register your bike';

  @override
  String get activateNcf => 'Activate your lock via RFID';

  @override
  String get activateNfcMessage =>
      'To connect to your bike lock you first need to activate the Bike with the RFID chip you received with the lock.';

  @override
  String get activateNfcMessage2 =>
      'Please place the RFID chip on the lock and wait until you can hear it beep. After you heard the noise, please press on \"Continue process\".';

  @override
  String get continueProcess => 'Continue process';

  @override
  String get createConnection => 'Connect to your lock';

  @override
  String get connectionSuccess => 'Connection successful';

  @override
  String get connectionFailed => 'Oops, we failed to connect to your lock';

  @override
  String get stats => 'Stats';

  @override
  String get retryScan => 'Retry scan';

  @override
  String get bikeNameLabel => 'Bike name';

  @override
  String get addBike => 'Add bike';

  @override
  String get kilometersLastMonth => 'Travelled kilometers';

  @override
  String get monthlyStats => 'Monthly Stats';
}
