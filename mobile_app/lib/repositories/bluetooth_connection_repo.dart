import 'dart:async';
import 'dart:convert';

import 'package:mobile_app/model/bike_with_device.dart';
import 'package:mobile_app/model/saved_bike.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepo {
  static final bikesKey = 'bikes';

  Future<List<Bike>> get savedBikes async {
    try {
      final bikes = (await SharedPreferences.getInstance()).getString(bikesKey);
      if (bikes == null) {
        return [];
      }
      final savedBikes = BikeList.fromJson(jsonDecode(bikes)).bikes;
      return savedBikes;
    } on Exception {
      return [];
    }
  }

  Future<List<BikeWitDevice>> savedBikesWithDevices() async {
    return (await savedBikes)
        .map((bike) => BikeWitDevice.fromBike(bike))
        .toList();
  }

  Future<void> replaceBikes(List<Bike> bikes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(bikesKey);
    final jsonString = jsonEncode(BikeList(bikes: bikes).toJson());
    prefs.setString(bikesKey, jsonString);
  }
}
