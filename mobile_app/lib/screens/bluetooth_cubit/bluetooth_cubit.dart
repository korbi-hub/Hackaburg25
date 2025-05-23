import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';
import 'package:mobile_app/model/saved_bike.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothCubitState> {
  final BluetoothConnectionRepo repo;

  BluetoothCubit({required this.repo}) : super(BluetoothInitial());

  late final StreamSubscription subscription;
  late final BluetoothDevice device;

  Future<void> init() async {
    if (await FlutterBluePlus.isSupported == false) {
      return;
    }

    var subscription = FlutterBluePlus.adapterState.listen((
      BluetoothAdapterState state,
    ) {
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
      } else {
        // show an error to the user, etc
      }
    });

    if (!kIsWeb && Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    subscription.cancel();
  }

  Future<void> connectToKnownDevices() async {}

  Future<void> forgetDevice(Bike bike) async {}

  Future<void> unlock(Bike bike) async {}

  Future<void> scan() async {
    FlutterBluePlus.startScan(
      timeout: Duration(seconds: 4),
      withNames: ['SherLock', 'Buds Pro'],
    );

    // Listen to the scanning results
    FlutterBluePlus.scanResults.listen((results) {
      if (results.isNotEmpty) {
        emit(
          BluetoothDeviceList(
            devices: results.map((device) => device.device).toList(),
          ),
        );
      }
    });

    // Optional: Stop scanning as needed
    await Future.delayed(Duration(seconds: 4));
    FlutterBluePlus.stopScan();
  }

  Future<void> debugSend(BluetoothDevice device) async {
    await device.connect();
  }
}
