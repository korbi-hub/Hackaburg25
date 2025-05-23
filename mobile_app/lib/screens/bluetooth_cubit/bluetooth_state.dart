part of 'bluetooth_cubit.dart';

@immutable
sealed class BluetoothCubitState {}

final class BluetoothInitial extends BluetoothCubitState {}

final class BluetoothDeviceList extends BluetoothCubitState {
  final List<BluetoothDevice> devices;

  BluetoothDeviceList({required this.devices});
}
