import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';
import 'package:mobile_app/model/saved_bike.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothCubitState> {
  static const String characteristicUuid =
      "beb5483e-36e1-4688-b7f5-ea07361b26a8"; // UUID für das BLE-Characteristic
  final BluetoothConnectionRepo repo;

  BluetoothCubit({required this.repo}) : super(BluetoothInitial());

  late final StreamSubscription subscription;

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

  Future<void> sendData(BluetoothDevice device, String data) async {
    final services = await device.discoverServices();

    for (final service in services) {
      for (final chara in service.characteristics) {
        final c = chara;
        if (chara.uuid.toString() == characteristicUuid) {
          List<int> bytesToSend = utf8.encode(data);
          await c.write(bytesToSend);
        }
      }
    }
  }

  Future<void> listenToChara(
    BluetoothCharacteristic characteristic,
    BluetoothDevice device,
  ) async {
    final subscription = characteristic.onValueReceived.listen((value) {
      debugPrint('Characteristic::$value');
    });

    // cleanup: cancel subscription when disconnected
    device.cancelWhenDisconnected(subscription);
  }

  Future<void> forgetDevice(Bike bike) async {
    final bikes =
        await repo.savedBikes
          ..remove(bike);
    repo.replaceBikes(bikes);
  }

  Future<void> unlock(Bike bike, BluetoothDevice device) async {
    await sendData(device, 'unlock');
  }

  Future<void> scan() async {
    emit(BluetoothLoading());

    FlutterBluePlus.startScan(
      timeout: Duration(seconds: 4),
      withNames: ['ShareLock', 'Buds Pro'],
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

    if (state is! BluetoothDeviceList) {
      emit(BluetoothInitial());
    }
  }

  Future<void> debugSend(BluetoothDevice device) async {
    await device.connect();

    await sendData(device, 'unlock');
  }
}
