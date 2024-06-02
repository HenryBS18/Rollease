part of 'selected_vehicle_bloc.dart';

sealed class SelectedVehicleState {}

final class SelectedVehicleInitial extends SelectedVehicleState {}

final class SelectedVehicle extends SelectedVehicleState {
  final Vehicle vehicle;

  SelectedVehicle(this.vehicle);
}
