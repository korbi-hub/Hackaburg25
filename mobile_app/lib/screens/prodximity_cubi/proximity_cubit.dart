import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/repositories/http_repo.dart';

part 'proximity_state.dart';

class ProximityCubit extends Cubit<ProximityState> {
  final HttpRepo repo;

  ProximityCubit(this.repo) : super(IsInDanger());

  Future<void> checkForDanger() async {
    while (true) {
      Future.delayed(Duration(seconds: 1));
      final isTooClose = await repo.isTooClose();
      if (isTooClose) {
        emit(IsInDanger(isTooClose: isTooClose));
      }
    }
  }
}
