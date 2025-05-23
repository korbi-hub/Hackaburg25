import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';
import 'package:mobile_app/screens/home/components/bike_info_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});
final count = 10;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          for (var i = 0; i < count; i++) ...[
            /* Icon(
                Icons.accessible_forward,
                color: Colors.pink,
                size: 300,
              )*/
            BikeInfoCard(bikeName: 'MTB'),
            //if (i != count) Divider(),
          ],
        ],
      ),
    );
  }
}
