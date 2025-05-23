import 'package:json_annotation/json_annotation.dart';

part 'saved_bike.g.dart';

@JsonSerializable(explicitToJson: true)
class Bike {
  final BikeLock? lock;
  final String bikeName;
  final bool isConnected;

  Bike({this.lock, this.bikeName = '', this.isConnected = false});

  factory Bike.fromJson(Map<String, dynamic> json) => _$BikeFromJson(json);
  Map<String, dynamic> toJson() => _$BikeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BikeList {
  final List<Bike> bikes;

  BikeList({this.bikes = const []});

  factory BikeList.fromJson(Map<String, dynamic> json) =>
      _$BikeListFromJson(json);

  Map<String, dynamic> toJson() => _$BikeListToJson(this);
}

@JsonSerializable()
class BikeLock {
  final String? lockUuid;
  final String bluetoothDeviceId;

  BikeLock({this.lockUuid, this.bluetoothDeviceId = ''});

  factory BikeLock.fromJson(Map<String, dynamic> json) =>
      _$BikeLockFromJson(json);
  Map<String, dynamic> toJson() => _$BikeLockToJson(this);
}
