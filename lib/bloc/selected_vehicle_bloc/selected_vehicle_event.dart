part of 'selected_vehicle_bloc.dart';

sealed class SelectedVehicleEvent {}

class SetSelectedVehicleEvent extends SelectedVehicleEvent {
  final int id;

  SetSelectedVehicleEvent(this.id);
}
