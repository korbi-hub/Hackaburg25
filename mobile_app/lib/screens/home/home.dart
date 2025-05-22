import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/extensions.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [Text(context.translate.home)]),
        ),
      ),
    );
  }
}
