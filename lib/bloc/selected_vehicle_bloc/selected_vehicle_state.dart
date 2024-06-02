part of 'selected_vehicle_bloc.dart';

sealed class SelectedVehicleState {}

final class SelectedVehicleInitial extends SelectedVehicleState {}

final class SelectedVehicleId extends SelectedVehicleState {
  final int id;

  SelectedVehicleId(this.id);
}
