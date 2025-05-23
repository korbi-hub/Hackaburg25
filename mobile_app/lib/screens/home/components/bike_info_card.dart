import 'package:flutter/material.dart';

class BikeInfoCard extends StatelessWidget {
  final String bikeName;

  const BikeInfoCard({super.key, required this.bikeName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [Text(bikeName)]),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.green,
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text('Unlock  '), Icon(Icons.bluetooth)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
