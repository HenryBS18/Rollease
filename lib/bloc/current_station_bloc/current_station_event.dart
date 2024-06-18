part of 'current_station_bloc.dart';

sealed class CurrentStationEvent {}

class AddCurrentStationEvent extends CurrentStationEvent {
  final Station station;

  AddCurrentStationEvent(this.station);
}
