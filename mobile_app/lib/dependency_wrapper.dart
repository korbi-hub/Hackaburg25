import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DependencyWrapper extends StatelessWidget {
  final Widget child;

  const DependencyWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(providers: [], child: child),
    );
  }
}
