import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/home/home.dart';
import 'package:mobile_app/screens/register_bike/register_bike.dart';
import 'package:mobile_app/screens/stats/stats_screen.dart';

class NavWrapper extends StatelessWidget {
  // final StatefulNavigationShell navigationShell;

  final ValueNotifier<int> indexNotifier = ValueNotifier(0);

  NavWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(context.translate.appName),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ValueListenableBuilder(
            valueListenable: indexNotifier,
            builder:
                (context, value, widget) => switch (value) {
                  1 => StatsScreen(),
                  _ => Home(),
                },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed:
              () => context.navigator.push(
                MaterialPageRoute(
                  builder: (context) => const RegisterBikeFlow(),
                ),
              ),
          child: Icon(Icons.directions_bike),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value,
            items: [
              BottomNavigationBarItem(
                label: context.translate.home,
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: context.translate.stats,
                icon: Icon(Icons.bar_chart),
              ),
            ],
            onTap: (index) => indexNotifier.value = index,
          );
        },
      ),
    );
  }
}
