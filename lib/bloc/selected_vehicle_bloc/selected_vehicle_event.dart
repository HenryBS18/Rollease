part of 'selected_vehicle_bloc.dart';

sealed class SelectedVehicleEvent {}

class SetSelectedVehicleEvent extends SelectedVehicleEvent {
  final Vehicle vehicle;

  SetSelectedVehicleEvent(this.vehicle);
}

class ResetSelectedVehicleEvent extends SelectedVehicleEvent {}
