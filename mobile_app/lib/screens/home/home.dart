import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(context.translate.home)]);
  }
}
