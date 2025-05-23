part of 'bike_registration_cubit.dart';

@immutable
sealed class BikeRegistrationState {}

final class RfidActivation extends BikeRegistrationState {}

final class EstablishConnection extends BikeRegistrationState {}

final class ScanningDevices extends BikeRegistrationState {}

final class ConnectionSuccess extends BikeRegistrationState {}

final class ConnectionError extends BikeRegistrationState {
  final ErrorScreenConfig config;

  ConnectionError(this.config);
}
