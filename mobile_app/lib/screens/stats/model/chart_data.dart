import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartData {
  final IconData? icon;
  final String name;
  final int value;

  ChartData({required this.name, this.value = 0, this.icon});

  static List<ChartData> get chartDataList => [
    ChartData(name: 'Dec', value: 125),
    ChartData(name: 'Jan', value: 120),
    ChartData(name: 'Feb', value: 98),
    ChartData(name: 'Mar', value: 134),
    ChartData(name: 'Apr', value: 150),
    ChartData(name: 'May', value: 130),
    // ChartData(month: 'Jun', numberOfKilometers: 160),
    // ChartData(month: 'Jul', numberOfKilometers: 145),
    // ChartData(month: 'Aug', numberOfKilometers: 155),
    // ChartData(month: 'Sep', numberOfKilometers: 140),
    // ChartData(month: 'Oct', numberOfKilometers: 130),
    // ChartData(month: 'Nov', numberOfKilometers: 110),
  ];

  static List<ChartData> get bikeStatsChartData => [
    ChartData(
      name: 'Total Distance (km)',
      value: 1820,
      icon: Icons.directions_bike,
    ),
    ChartData(
      name: 'Total Rides',
      value: 96,
      icon: Icons.history,
    ),
    ChartData(
      name: 'Average Speed (km/h)',
      value: 24,
      icon: Icons.speed,
    ),
    ChartData(
      name: 'Max Speed (km/h)',
      value: 48,
      icon: Icons.flash_on,
    ),
    ChartData(
      name: 'Total Time (hrs)',
      value: 78,
      icon: Icons.timer,
    ),
    ChartData(
      name: 'Calories Burned',
      value: 45120,
      icon: Icons.local_fire_department,
    ),
    ChartData(
      name: 'Elevation Gain (m)',
      value: 3250,
      icon: Icons.terrain,
    ),
    ChartData(
      name: 'Longest Ride (km)',
      value: 75,
      icon: Icons.route,
    ),
    ChartData(
      name: 'Ride Days',
      value: 85,
      icon: Icons.calendar_today,
    ),
    ChartData(
      name: 'Flat Tires',
      value: 3,
      icon: Icons.report_problem,
    ),
    ChartData(
      name: 'Maintenance Sessions',
      value: 5,
      icon: Icons.build,
    ),
    ChartData(
      name: 'CO2 Saved (kg)',
      value: 128,
      icon: Icons.eco,
    ),
  ];
}
