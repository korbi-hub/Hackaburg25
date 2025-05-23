import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/model/saved_bike.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';
import 'package:mobile_app/screens/register_bike/error_screen_config/error_screen_config.dart';

part 'bike_registration_state.dart';

class BikeRegistrationCubit extends Cubit<BikeRegistrationState> {
  final BluetoothConnectionRepo repo;

  late final List<Bike> savedBikes;

  BikeRegistrationCubit(this.repo) : super(RfidActivation());

  Future<void> init() async => savedBikes = await repo.savedBikes;

  void startScanning() => emit(EstablishConnection());

  void goToRegistration(BluetoothDevice device) =>
      emit(ConnectionSuccess(device));

  Future<void> finishProcess(Bike bike, BuildContext context) async {
    final bikes = await repo.savedBikes;
    if (!bikes.any((b) => b.lock?.lockUuid == bike.lock?.lockUuid)) {
      repo.replaceBikes(bikes..add(bike));
    }
    Navigator.pop(context);
  }
}
