// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_bike.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bike _$BikeFromJson(Map<String, dynamic> json) => Bike(
      lock: json['lock'] == null
          ? null
          : BikeLock.fromJson(json['lock'] as Map<String, dynamic>),
      bikeName: json['bikeName'] as String? ?? '',
      isConnected: json['isConnected'] as bool? ?? false,
    );

Map<String, dynamic> _$BikeToJson(Bike instance) => <String, dynamic>{
      'lock': instance.lock?.toJson(),
      'bikeName': instance.bikeName,
      'isConnected': instance.isConnected,
    };

BikeList _$BikeListFromJson(Map<String, dynamic> json) => BikeList(
      bikes: (json['bikes'] as List<dynamic>?)
              ?.map((e) => Bike.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BikeListToJson(BikeList instance) => <String, dynamic>{
      'bikes': instance.bikes.map((e) => e.toJson()).toList(),
    };

BikeLock _$BikeLockFromJson(Map<String, dynamic> json) => BikeLock(
      lockUuid: json['lockUuid'] as String?,
      bluetoothDeviceId: json['bluetoothDeviceId'] as String? ?? '',
    );

Map<String, dynamic> _$BikeLockToJson(BikeLock instance) => <String, dynamic>{
      'lockUuid': instance.lockUuid,
      'bluetoothDeviceId': instance.bluetoothDeviceId,
    };
