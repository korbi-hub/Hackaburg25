import 'dart:async';

import 'package:mobile_app/model/saved_bike.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BluetoothConnectionRepo {
  final bikesKey = 'bikes';

  Future<List<Bike>> get savedBikes async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedBikes =
          BikeList.fromJson(
            prefs.getString(bikesKey) as Map<String, dynamic>,
          ).bikes;
      return savedBikes;
    } on Exception catch (e) {
      return [];
    }
  }

  Future<void> replaceBikes(List<Bike> bikes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(bikesKey, BikeList(bikes: bikes).toJson().toString());
  }
}
