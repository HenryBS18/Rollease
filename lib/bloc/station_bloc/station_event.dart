part of 'station_bloc.dart';

sealed class StationEvent {}

class FetchStationListEvent extends StationEvent {}

class AddStationListEvent extends StationEvent {}
