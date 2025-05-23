import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/screens/register_bike/error_screen_config/error_screen_config.dart';

part 'bike_registration_state.dart';

class BikeRegistrationCubit extends Cubit<BikeRegistrationState> {
  BikeRegistrationCubit() : super(RfidActivation());

  void init() {}

  void startScanning() {
    emit(EstablishConnection());
  }
}
