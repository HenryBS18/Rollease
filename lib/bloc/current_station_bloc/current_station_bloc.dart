import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rollease/models/station.dart';

part 'current_station_event.dart';
part 'current_station_state.dart';

class CurrentStationBloc extends Bloc<CurrentStationEvent, CurrentStationState> {
  CurrentStationBloc() : super(CurrentStationInitial()) {
    on<GetCurrentStationEvent>((event, emit) {
      emit(CurrentStation(event.station));
      print("udah");
    });
  }
}
