part of 'current_station_bloc.dart';

sealed class CurrentStationEvent {}

class GetCurrentStationEvent extends CurrentStationEvent {
  final List<Station> station;

  GetCurrentStationEvent(this.station);
}
