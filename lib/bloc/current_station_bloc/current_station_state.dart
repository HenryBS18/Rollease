part of 'current_station_bloc.dart';

sealed class CurrentStationState {}

final class CurrentStationInitial extends CurrentStationState {}

final class CurrentStation extends CurrentStationState {
  final Station station;

  CurrentStation(this.station);
}
