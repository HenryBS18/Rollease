import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rollease/models/station.dart';
import 'package:rollease/services/station_service.dart';

part 'station_event.dart';
part 'station_state.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  StationBloc() : super(StationInitial()) {
    on<FetchStationListEvent>((event, emit) async {
      List<Station>? stationList = await StationService().getAll();

      emit(StationList(stationList));
    });
  }
}
