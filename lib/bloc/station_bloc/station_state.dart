part of 'station_bloc.dart';

sealed class StationState {}

final class StationInitial extends StationState {}

final class StationList extends StationState {
  final List<Station> stationList;

  StationList(this.stationList);
}
