import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_vehicle_event.dart';
part 'selected_vehicle_state.dart';

class SelectedVehicleBloc extends Bloc<SelectedVehicleEvent, SelectedVehicleState> {
  SelectedVehicleBloc() : super(SelectedVehicleInitial()) {
    on<SetSelectedVehicleEvent>((event, emit) {
      emit(SelectedVehicleId(event.id));
    });
  }
}
