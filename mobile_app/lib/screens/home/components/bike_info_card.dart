import 'package:flutter/material.dart';

class BikeInfoCard extends StatelessWidget {
  final String bikeName;

  const BikeInfoCard({super.key, required this.bikeName});

  @override
  Widget build(BuildContext context) {
    final isConnected = true;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bikeName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                if (isConnected)
                  Icon(Icons.check_circle, color: Colors.green, size: 30),
                if (!isConnected)
                  Icon(Icons.close, color: Colors.red, size: 30),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isConnected ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Unlock  '),
                      Icon(Icons.bluetooth),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
