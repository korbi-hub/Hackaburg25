import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/model/saved_bike.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';
import 'package:mobile_app/screens/register_bike/error_screen_config/error_screen_config.dart';

part 'bike_registration_state.dart';

class BikeRegistrationCubit extends Cubit<BikeRegistrationState> {
  final BluetoothConnectionRepo repo;

  late final List<Bike> savedBikes;

  BikeRegistrationCubit(this.repo) : super(RfidActivation());

  Future<void> init() async {
    savedBikes = await repo.savedBikes;
  }

  void startScanning() {
    emit(EstablishConnection());
  }
}
