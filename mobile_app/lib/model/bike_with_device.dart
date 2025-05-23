import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_app/model/saved_bike.dart';

class BikeWitDevice {
  final Bike bike;
  final BluetoothDevice? device;

  const BikeWitDevice(this.bike, this.device);

  factory BikeWitDevice.fromBike(Bike bike) => BikeWitDevice(
    bike,
    bike.lock == null
        ? null
        : BluetoothDevice.fromId(bike.lock!.bluetoothDeviceId),
  );
}
