import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/model/bike_with_device.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BluetoothConnectionRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getBikes() async {
    final data = await repo.savedBikesWithDevices();

    emit(BikeDataState(data));
  }
}
