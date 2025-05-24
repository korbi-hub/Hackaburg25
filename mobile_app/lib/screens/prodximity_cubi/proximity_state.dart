part of 'proximity_cubit.dart';

@immutable
sealed class ProximityState {}

final class IsInDanger extends ProximityState {
  final bool? isTooClose;

  IsInDanger({this.isTooClose = false});
}
