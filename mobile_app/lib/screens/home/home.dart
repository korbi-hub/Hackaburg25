import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/home/components/bike_info_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.appName),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              /* Icon(
                Icons.accessible_forward,
                color: Colors.pink,
                size: 300,
              )*/
              BikeInfoCard(bikeName: 'MTB'),
              BikeInfoCard(bikeName: 'Rennrad',)

            ],
          ),
        ),
      ),
    );
  }
}
