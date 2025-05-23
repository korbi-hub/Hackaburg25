part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BikeDataState extends HomeState {
  final List<BikeWitDevice> bikesWithDevice;

  BikeDataState(this.bikesWithDevice);
}
